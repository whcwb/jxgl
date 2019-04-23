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
			<Col span="5">
				<FormItem label="商业险保单编号">
					<Input v-model="form.inBdh" placeholder="请输入商业险保单编号" ></Input>
				</FormItem>
			</Col>
			<Col span="7">
				<FormItem label="商业险起保时间">
					<DatePicker v-model="dateRange1" @on-change="form.inQbrqInRange = v.util.dateRangeChange(dateRange1)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
				</FormItem>
			</Col>
			<Col span="5">
				<FormItem label="商业险终保时间">
					<DatePicker v-model="dateRange2" @on-change="form.inZbrqInRange = v.util.dateRangeChange(dateRange2)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
				</FormItem>
			</Col>
			<Col span="7">
				<FormItem label="交强险起保时间">
					<DatePicker v-model="dateRange3" @on-change="form.inJqqbrqInRange = v.util.dateRangeChange(dateRange3)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
				</FormItem>
			</Col>
			<Col span="6">
				<FormItem label="交强险终保时间">
					<DatePicker v-model="dateRange4" @on-change="form.inJqzbrqInRange = v.util.dateRangeChange(dateRange4)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
				</FormItem>
			</Col>
			<Col span="4">
				<FormItem label="选项">
					<Select clearable v-model="param" placeholder="请选择..." @on-change="v=>{param=(v==undefined?-1:param)}">
						<Option value="0">交强险临期</Option>
						<Option value="1">商业险临期</Option>
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
    import notifyList from './notifyList.vue'
    import swal from 'sweetalert2'
	//文件上传
    import uploadFile from './uploadFile.vue'
    export default {
        name: 'insuranceTable',
        components: {formData, uploadFile,notifyList},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.insurance,
                tableHeight: 220,
                componentName: '',
                dateRange1:'',
                dateRange2:'',
                dateRange3:'',
                dateRange4:'',
                choosedItem: null,
				param:-1,								//选项需要传递的url参数
                paramArr:{0:'?bxlq=jqx',1:'?bxlq=syx'},
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '车牌号码',key:'vHphm'},
                    {title: '商业险保单号', width: 120,key:'inBdh'},
                    {title: '商业险保险公司',key:'inBxgs'},
                    {title: '商业险起保时间',key:'inQbrq'},
                    {title: '商业险终保时间',key:'inZbrq'},
                    {title: '商业险保险金额',key:'inBxje'},
                    {title: '商业险险种',key:'inXz',render:(h, params)=>{
                        let val = $.map(this.dicts.bxsyxz.items, item => {
                            if(params.row.inXz.indexOf(item.key) != -1) {
                                return item.val + ',';
                            }
                        });

                        return val;
                    }},
                    {title: '交强险保单号', width: 120,key:'inJqbdh'},
                    {title: '交强险保险公司',key:'inJqbxgs'},
                    {title: '交强险起保时间',key:'inJqqbrq'},
                    {title: '交强险终保时间',key:'inJqzbrq'},
                    {title: '交强险保险金额',key:'inJqbxje'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 200,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),

                                this.util.buildButton(this,h,'success','ios-email-outline','发送短信',()=>{
                                    swal({
                                        text: "是否发送短信通知?",
                                        type: "warning",
                                        showCancelButton: true,
                                        confirmButtonText: '确认',
                                        cancelButtonText: '取消'
                                    }).then((isConfirm) => {
                                        if (isConfirm.value) {
                                            this.sendSms(params.row.inId);
                                        }
                                    });
                                }),
                                this.util.buildButton(this,h,'success','eye','联系记录',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'notifyList';
                                }),
                                this.util.buildButton(this, h, 'info', 'ios-cloud-upload', '档案上传', ()=>{this.uploadFilePage(params)}),
                                this.util.buildDeleteButton(this,h,params.row.inId),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                dicts:{
                    bxsyxz:{code:'BXSYXZ',items:[]},
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
			//档案上传
            uploadFilePage(param){
				this.choosedItem = param.row;
				this.componentName = 'uploadFile';
			},
            sendSms(id){
                this.$http.post(this.apis.insurance.SEND_SMS,{inId:id}).then((res)=>{
                    this.util.showResMessage(this,res);
                })
            }
        }
    }
</script>
