<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row justify="space-between">
				<Col span="5">
					<FormItem label="车牌号">
						<Input v-model="form.vHphmLike" placeholder="请输入车牌号" ></Input>
					</FormItem>
				</Col>
				<Col span="6">
					<FormItem label="违法时间">
						<DatePicker :value="form.tWfsj" @on-change="(date)=>{form.wfWfsjInRange = date[0]+','+date[1]}" type="daterange" confirm placement="bottom-end" placeholder="请选择违法时间" style="width: 200px"></DatePicker>
					</FormItem>
				</Col>
				<Col span="5">
					<FormItem label="处理状态">
						<Select filterable clearable  v-model="form.wfWfzt" placeholder="'请选择状态">
							<Option v-for = "(item,index) in v.dictUtil.getByCode(v,'WFZT')" :value="item.key">{{item.val}}</Option>
						</Select>
					</FormItem>
				</Col>
				<Col span="4" offset="1">
					<Button type="primary" @click="v.util.getPageData(v)">
						<Icon type="search"></Icon>
					</Button>
					<Button type="primary" @click="v.util.add(v)">
						<Icon type="plus-round"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
		<Row style="position: relative;">
			<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<Row class="margin-top-10 pageSty">
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
				  @on-change='pageChange'></Page>
		</Row>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'
    import notifyList from './notifyList'
    import swal from 'sweetalert2'
    export default {
        name: 'wfxx',
        components: {formData,notifyList},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.illegal,
                tableHeight: 120,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'车牌号码', width: 160,key:'vHphm'},
                    {title:'车架号', width: 160, key:'vCjh'},
                    {title:'违法时间', width: 160,key:'wfWfsj'},
                    {title:'违法地点', width: 160,key:'wfWfdz'},
                    {title:'违法行为',width: 360,key:'wfWfxw'},
                    {title:'违法记分', width: 160,key:'wfWfjf'},
                    {title:'违法金额', width: 160,key:'wfWfje'},
                    {title:'负责人', width: 160,key:'fzr'},
                    {title:'负责人联系方式', width: 160,key:'fzrlxfs'},
                    {title:'违法状态', width: 160,key:'wfWfzt',render:(h, params)=>{
                        let val = $.map(this.dicts.wfzt.items, item => {
                            if(item.key == params.row.wfWfzt) {
                                return item.val;
                            }
                        });
                        const color = params.row.wfWfzt === '02' ? 'blue' : 'red';
                        return h('Tag', {
                            props: {
                                type: 'dot',
                                color: color
                            }
                        }, val);
                    }},
                    {
                        title: '操作',
                        key: 'action',
                        width: 160,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'success','ios-email-outline','发送短信',()=>{
                                    swal({
                                        text: "是否发送短信通知?",
                                        type: "warning",
                                        showCancelButton: true,
                                        confirmButtonText: '确认',
                                        cancelButtonText: '取消'
                                    }).then((isConfirm) => {
                                        if (isConfirm.value) {
                                            this.sendSms(params.row.wfId);
                                        }
                                    });
                                }),
                                this.util.buildButton(this,h,'success','eye','联系记录',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'notifyList';
                                }),
                                this.util.buildEditButton(this,h,params),
                                this.util.buildDeleteButton(this,h,params.row.wfId),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    orderBy:'wfWfsj desc,vHphm asc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                dicts:{
                    wfzt:{code:'WFZT',items:[]},
                }
            }
        },
        created() {
            this.util.initTable(this);
            this.util.initDict(this);
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
			sendSms(wfId){
                this.$http.post(this.apis.illegal.SEND_SMS,{wfId:wfId}).then((res)=>{
                    this.util.showResMessage(this,res);
				})
			}
        }
    }
</script>
