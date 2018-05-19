<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" title="充值">
			<div style="overflow: auto;height: 500px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<Col v-for="i in formInputs" :span="i.span ? i.span : 12">
						<FormItem :prop='i.prop' :label='i.label'>
								<Input type="text" v-model="formItem[i.prop]" :placeholder="'请填写'+i.label+'...'" :disabled="i.readonly"></Input>
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
	export default {
		name: '',
		data() {
			return {
			    v:this,
				saveUrl:this.apis.OIL_CARD.CHARGE,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
					ykId:0,
                    ykYe:'',
					amount:''
				},
                formInputs:[
                    {label:'卡号',prop:'ykId',readonly:true},
                    {label:'发卡公司',prop:'ykId',readonly:true},
                    {label:'卡余额',prop:'ykYe',readonly:true},
                    {label:'充值余额',prop:'amount',required:true},
                ],
                ruleInline:{
				}
			}
		},
		created(){
		},
		mounted(){
            this.util.initFormModal(this);
		},
		methods: {
		    beforeSave(){
		        this.formItem = {
					cardId:this.formItem.ykId,
					amount:this.formItem.amount,
				}
			}
		}
	}
</script>

<style>

</style>
