<style lang="less">
	@import '../../../../styles/common.less';
</style>

<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" title="车辆年审">
			<div style="overflow: auto;height: 380px;">
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
                saveUrl:this.apis.CAR.CLNS,
				showModal: true,
				readonly: false,
				formItem: {
			        vId:'',
                    vlXqlx:'10',
				},
                formInputGroups:[
                    [
                        {label:'车牌号',prop:'vHphm', readonly:true, disabled: true, span:'8'},
                    	{label:'初次登记日期',prop:'vCcdjrq', readonly:true, disabled: true, span:'8'},
                    	{label:'年审日期',prop:'vNsrq', readonly:true, disabled: true, span:'8'}
                    ],
                    [
                        {label:'本次年审日期',prop:'vlXqsj',type:'datetime',required:true, span:'12'},
                    	{label:'下次年审日期',prop:'vlBz',type:'date',required:true, span:'12'}
                    ],
                    [
                        {label:'年审内容',prop:'vlText',required:true, span:'24'}
					]
                ],
                ruleInline:{
				}
			}
		},
		created(){
		    this.util.initFormModal(this);
		},
		methods: {

		}
	}
</script>

<style>

</style>
