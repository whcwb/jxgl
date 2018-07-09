<style type="text/css">
</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
        			:mask-closable="false" :title="operate+''">
        	<div style="overflow: auto;height: 500px;">
        		<Form ref="form"
        			:model="formItem"
        		    :rules="ruleInline"
        			:label-width="100"
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
	export default {
		name: 'TransitionLogForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'车辆id',prop:'clId'},
                    {label:'车牌号',prop:'cph'},
                    {label:'创建时间',prop:'createTime'},
                    {label:'创建人id',prop:'createUserId'},
                    {label:'创建人姓名',prop:'createUserName'},
                    {label:'操作类型',prop:'type'},
                    {label:'文件路径',prop:'filePath'},
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
