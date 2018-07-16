<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" title="出车申请">
			<div style="overflow: auto;height: 500px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="120"
						:styles="{top: '20px'}">
					<Row>
						<form-items :parent="v"></form-items>
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
		name: 'usecarForm',
		components:{formItems},
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
                    ucCclcs:'',
				},
                formInputs:[
                    {label:'车辆',prop:'vId',type:'foreignKey', span:24, required:true},
                    {label:'出车时间',prop:'ucCcsj',type:'date',required:true},
                    {label:'还车时间',prop:'ucYjhcsj',type:'date',required:true},
                    {label:'出车事由',prop:'ucCcsy',required:true, span:24},
                    {label:'借用人',prop:'ucJyrid',type:'foreignKey',required:true},
                    {label:'出车前里程数',prop:'ucCclcs'},
                ],
                foreignList:{
                    vId:{url:this.apis.CAR.notUseCarList,key:'vId',val:'vHphm',items:[]},
                    ucJyrid:{url:this.apis.USER.QUERY,key:'yhid',val:'xm',items:[]},
                },
                ruleInline:{
				}
			}
		},
		computed:{
            carNumber(){
                return this.formItem.vId
			}
		},
		watch:{
			carNumber(o,n){
                this.getLastReturnMileage();
			}
		},
		created(){
		    this.util.initFormModal(this);
		},
		methods: {
            getLastReturnMileage(){
                this.formItem.ucCclcs = '';
				this.$http.get(this.apis.userCar.getLastReturnMileage+'?carId='+this.formItem.vId).then((res)=>{
              		if (res.code === 200 && res.result){
                        this.formItem.ucCclcs = res.result;
					}
				})
			},
		}
	}
</script>

<style>

</style>
