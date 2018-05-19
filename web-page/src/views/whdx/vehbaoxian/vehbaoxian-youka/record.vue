<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false' :mask-closable="false">
			<div style="overflow: auto;height: 500px;">
				<Tabs>
					<Tab-pane label="充值记录" icon="ios-download-outline">
						<charge-record></charge-record>
					</Tab-pane>
					<Tab-pane label="消费记录" icon="ios-upload-outline">
						<use-record></use-record>
					</Tab-pane>
				</Tabs>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
				<Button type="primary" @click="v.util.save(v)">确定</Button>
			</div>
		</Modal>
	</div>
</template>

<script>
	import chargeRecord from './chargeRecord'
	import useRecord from './useRecord'
	export default {
		name: '',
		components:{chargeRecord,useRecord},
		data() {
			return {
			    v:this,
			    apiRoot :this.apis.OIL_CARD,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'油卡卡号',prop:'ykId',required:true,readonly:true},
                    {label:'发卡公司',prop:'ykFkgs',required:true},
                    {label:'卡余额',prop:'ykYe',required:true,readonly:true},
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
