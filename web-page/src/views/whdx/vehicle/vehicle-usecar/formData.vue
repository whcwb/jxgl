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
		name: 'usecarForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'车牌id',prop:'vId'},
                    {label:'违法编号',prop:'wfId',required:true},
                    {label:'车牌号码',prop:'vHphm'},
                    {label:'出车时间',prop:'ucCcsj'},
                    {label:'出车事由',prop:'ucCcsy'},
                    {label:'违法编号',prop:'wfId',required:true},
                    {label:'借用人id',prop:'ucJyrid'},
                    {label:'借用人',prop:'ucJyr'},
                    {label:'预计还车时间',prop:'ucYjhcsj'},
                    {label:'违法编号',prop:'wfId',required:true},
                    {label:'出车前里程数',prop:'ucCclcs'},
                    {label:'还车里程数',prop:'unHclcs'},
                    {label:'备注',prop:'ucBz'},
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
