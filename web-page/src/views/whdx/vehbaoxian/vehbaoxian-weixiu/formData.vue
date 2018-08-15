<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" :title="operate+''">
			<div style="overflow: auto;height: 500px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<form-items :parent="v"></form-items>
						<Col span="12">
							<FormItem prop='money' label='应付维修金额'>
								<Input type="text" v-model="formItem.money" placeholder="请填写应付维修金额..."
									   @on-change="moneyChange" ></Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem prop='insuranceMoney' label='保险抵扣金额'>
								<Input type="text" v-model="formItem.insuranceMoney" placeholder="请填写保险抵扣金额..."
									   @on-change="moneyChange" ></Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem prop='realMoney' label='维修实付金额'>
								<Input type="text" v-model="formItem.realMoney" placeholder="维修实付金额"
									   readonly></Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem prop='realMoney' label='库存商品'>
								<Button type="primary" @click="chooseStock">添加</Button>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<Table :height="200" :columns="tableColumns" :data="productData"></Table>
					</Row>
				</Form>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
				<Button type="primary" @click="saveStock">确定</Button>
			</div>
		</Modal>
		<component :is="componentName"></component>
	</div>
</template>

<script>
	import formItems from '../../components/formItems'
	import chooseStock from './chooseStock'
    import swal from 'sweetalert2'
	export default {
		name: 'wxjlForm',
		components:{formItems,chooseStock},
		data() {
			return {
			    v:this,
                operate:'维修',
				saveUrl:this.apis.repair.ADD,
                componentName:'',
				showModal: true,
				readonly: false,
                productData:[],
				formItem: {
			        vId:'',
                    vHphm:'',
                    money:0,
                    insuranceMoney:0,
                    realMoney:0
				},
                formInputs:[
                    {label:'车牌号码',prop:'vHphm',readonly:true},
                    {label:'维修项目',prop:'project'},
                    {label: '维修时间',prop:'repairTime',type:'datetime'},
                ],
                ruleInline:{
				},
                tableColumns:[
                    {title: "序号", width: 70, type: 'index'},
                    {title: "商品名称", key: 'productName'},
                    {title: "数量", key: 'number'},
					{title: '操作',
						render:(h,p)=>{
                            return h('Tooltip',
                                {props: {placement: 'top',content: '删除',}},
                                [
                                    h('Button', {
                                        props: {type: 'error',icon: 'close',shape: 'circle',size: 'small'},
                                        style: {margin: '0 8px 0 0'},
                                        on: {click: ()=>{
                                                this.del(p.index)
											}}
                                    }),
                                ]
                            )
						}
					}
				]
			}
		},
		created(){
		    this.formItem.vId = this.$parent.choosedItem.vId;
		    this.formItem.vHphm = this.$parent.choosedItem.vHphm;
            this.util.initFormModal(this);
		},
		methods: {
		    moneyChange(){
                this.formItem.realMoney = this.formItem.money - this.formItem.insuranceMoney;
			},
			beforeSave(){
		        this.saveStock();
			},
            del(i){
                swal({
                    text: "是否删除数据?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: '确认',
                    cancelButtonText: '取消'
                }).then((isConfirm) => {
                    if (isConfirm.value) {
                        this.productData.splice(i,1);
                    }
                });
            },
            chooseStock(){
                this.componentName = 'chooseStock';
			},
			saveStock(){
		        this.$http.post(this.apis.stock.outStocks,{stocks:JSON.stringify(this.productData)}).then((res)=>{
		            if (res.code == 200){
                        this.util.save(this)
                    }
				})
			}
		}
	}
</script>

<style>

</style>
