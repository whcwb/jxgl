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
	import formItems from '../../components/formItems'
	export default {
		name: 'notifyForm',
		components:{formItems},
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
                    type:'1'
				},
                formInputs:[
                    // {label:'车牌号',prop:'clId',type:'foreignKey'},
                    // {label:'类型',prop:'type',type:'dict',dict:'tzlx'},
                    {label:'通知时间',prop:'time',type:'datetime'},
                    {label:'内容',prop:'content'},
                ],
                ruleInline:{
				},
                foreignList:{
                    clId:{url:this.apis.CAR.QUERY,key:'vId',val:'vHphm',items:[]},
                },
                dicts:{
                    tzlx:{code:'tzlx',items:[]},
                },
			}
		},
		created(){
		    this.util.initFormModal(this);
            this.util.initDict(this);
            this.formItem.time = new Date().format("yyyy-MM-dd hh:mm:ss");
            this.formItem.clId = this.$parent.form.clId;
            this.formItem.type = this.$parent.form.type;
		},
		methods: {
		}
	}
</script>

<style>

</style>
