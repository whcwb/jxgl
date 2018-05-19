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
		name: 'byxxForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'车辆id',prop:'vId',required:true},
                    {label:'车牌号码',prop:'vHphm'},
                    {label:'最后一次保养时间',prop:'byBysj'},
                    {label:'最后一次保养金额',prop:'byByje'},
                    {label:'修改人',prop:'updateUser'},
                    {label:'修改时间',prop:'updateTime'},
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
