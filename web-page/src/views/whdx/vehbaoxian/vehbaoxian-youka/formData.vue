<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false' :mask-closable="false" :title="operate+'油卡'">
			<div style="overflow: auto;height: 500px;">
				<Form ref="form" :model="formItem" :rules="ruleInline" :label-width="100" :styles="{top: '20px'}">
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
		name: '',
        components:{formItems},
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
                    {label:'卡余额',prop:'ykYe',readonly:true},
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
