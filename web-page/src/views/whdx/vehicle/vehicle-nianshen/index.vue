<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row  justify="space-between">
				<Col span="5">
					<FormItem label="车牌号">
						<Input v-model="form.vHphmLike" placeholder="请输入车牌号" ></Input>
					</FormItem>
				</Col>
				<Col span="5">
					<FormItem label="年审日期">
						<DatePicker :value="form.vNsrqLike" type="month" placement="top-start" placeholder="请选择日期" @on-change="(date)=>{form.vNsrqLike = date}"></DatePicker>
					</FormItem>
				</Col>
				<Col span="4" offset="1">
					<Button type="primary" @click="v.util.getPageData(v)">
						<Icon type="search"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
		<Row style="position: relative;">
			<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<Row class="margin-top-10 pageSty">
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>
		</Row>
		<div id="printDiv" ref="printDiv" style="position: absolute;left:0;top:0;z-index: -10">
			<ul>
				<li>
					<img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="680">
					<!--<img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszfmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="340">-->
				</li>
				<li>
					<img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="680">
					<!--<img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">-->
				</li>
			</ul>
		</div>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'
	import searchItems from '../../components/searchItems'
    import swal from 'sweetalert2'
    import Print from 'print-js'
    export default {
        name: 'usecar',
        components: {formData,searchItems},
        data() {
            return {
                v:this,
                dateRange:'',
                SpinShow: true,
                apiRoot:this.apis.CAR,
				today:'',
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                jszPrintImgs:[],
                xszPrintImgs:[],
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title:'车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '初登日期',key:'vCcdjrq'},
                    {title: '年审日期',key:'vNsrq',render:(h, params)=>{
                            let today = new Date().format("yyyy-MM-dd");
                            let f = today >= params.row.vNsrq;
                            let content = "请尽快完成年审";
                            let color = "red";
                            if (!f){
                                color = "green";
                                content = "暂不需要年审";
                            }

                            return h('Tooltip', {
                                props: {
                                    trigger: 'hover',
                                    content: content,
                                    placement: 'bottom'
                                }
                            },[
                                h('Tag', {
                                    props: {
                                        type: 'dot',
                                        color: color
                                    }
                                }, params.row.vNsrq)
                            ]);
                        },
                        filters: [
                            {
                                label: '超期未年审',
                                value: 1
                            }
                        ],
                        filterMultiple: false,
                        filterMethod (value, row) {
                            let today = new Date().format("yyyy-MM-dd");
                            let f = today >= row.vNsrq;
                            if (!f){
                                return false;
                            }

                            return true;
                        }
                    },
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            let buttons = [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this, h, 'info', 'printer', '年审打印', ()=>{this.showNsdyPage(params)}),
                                this.util.buildButton(this, h, 'info', 'email', '年审通知', ()=>{this.showDxtzPage(params)}),
							];
                            return h('div', buttons);
                        }
                    }
                ],
                pageData: [],
                form: {
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
            }
        },
        created() {
            this.today = new Date().format("yyyy-MM-dd");
            this.util.initTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
            //年审打印
            showNsdyPage(param){
                let v = this;
                swal.showLoading();
                v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vId).then((res) =>{
                    if (res.code === 200 && res.result != null && res.result.length > 0){
                        this.xszPrintImgs = res.result;

                        v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vLxr.split('-')[0]).then((res) =>{
                            swal.close();

                            this.jszPrintImgs = res.result;
                            setTimeout(()=>{
                                Print({
                                    printable: 'printDiv',
                                    type: 'html'
                                });
							}, 800);
                        }, (error)=>{
                            swal({
                                text: '网络异常',
                                type: 'error'
                            })
                        });
                    }else{
                        swal({
                            text: "请先上传证件！",
                            type: "error"
                        })
                    }
                }, (error)=>{
                    swal({
                        text: '网络异常',
                        type: 'error'
                    })
                })
            },
            //年审通知
            showDxtzPage(param){
                let v = this;
                swal.queue([{
                    text: "确认发送年审通知短信?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                    showLoaderOnConfirm: true,
                    preConfirm: function () {
                        return new Promise(function (resolve) {
                            v.$http.get(v.apis.CAR.SENDSMS + param.row.vId).then((res) =>{
                                let type = "success";
                                if(res.code !== 200){
                                    type = "error";
                                }
                                swal.insertQueueStep({
                                    text: res.message,
                                    type: type
                                })

                                resolve();
                            }, (error)=>{
                                swal.insertQueueStep({
                                    text: '网络异常',
                                    type: 'error'
                                })
                                resolve();
                            })
                        })
                    }
                }]);
            }
        }
    }
</script>
