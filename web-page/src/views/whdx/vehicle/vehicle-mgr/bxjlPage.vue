<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
		<Row justify="space-between">
			<Col span="5">
				<FormItem label="商业险保单编号">
					<Input v-model="form.inBdh" placeholder="请输入商业险保单编号" ></Input>
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
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
				  @on-change='pageChange'></Page>
		</Row>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    export default {
        name: 'insuranceTable',
        props:{
            vehcile:{
                type:Object,
                default:{}
            }
        },
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.insurance,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
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
            this.form.vId = this.vehcile.vId;
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
