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
						<Col v-for="i in formInputs" :span="i.span ? i.span : 12">
						<FormItem :prop='i.prop' :label='i.label'>
								<Input type="text" v-model="formItem[i.prop]" :placeholder="'请填写'+i.label+'...'"></Input>
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
		name: 'insuranceForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'保单编号',prop:'inBdh'},
                    {label:'车辆ID',prop:'vId'},
                    {label:'车牌号码',prop:'vHphm'},
                    {label:'商业险保险公司',prop:'inBxgs'},
                    {label:'商业险保险电话',prop:'inBxdh'},
                    {label:'商业险起保时间',prop:'inQbrq'},
                    {label:'商业险终保时间。根据起保时间自动推算一年',prop:'inZbrq'},
                    {label:'商业险保险金额',prop:'inBxje'},
                    {label:'商业险险种。多个险种使用,分隔',prop:'inXz'},
                    {label:'交强险保单号',prop:'inJqbdh'},
                    {label:'交强险保险公司',prop:'inJqbxgs'},
                    {label:'交强险保险电话',prop:'inJqbxdh'},
                    {label:'交强险起保时间',prop:'inJqqbrq'},
                    {label:'交强险终保时间。根据起保时间自动推算一年',prop:'inJqzbrq'},
                    {label:'交强险保险金额',prop:'inJqbxje'},
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
