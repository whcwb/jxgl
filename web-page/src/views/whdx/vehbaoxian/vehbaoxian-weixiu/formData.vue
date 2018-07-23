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
					</Row>
				</Form>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
				<Button type="primary" @click="v.util.save(v)">确定</Button>
			</div>
		</Modal>
	</div>
</template>

<script>
	import formItems from '../../components/formItems'
	export default {
		name: 'wxjlForm',
		components:{formItems},
		data() {
			return {
			    v:this,
                operate:'维修',
				saveUrl:this.apis.repair.ADD,
				showModal: true,
				readonly: false,
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
                    {label: '维修时间',prop:'createTime',type:'datetime'},
                ],
                ruleInline:{
				}
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

			}
		}
	}
</script>

<style>

</style>
