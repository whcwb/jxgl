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
        components:{formItems},
		name: 'stockForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'商品编码',prop:'productCode'},
                    {label:'商品名称',prop:'productName'},
                    {label:'库存数量',prop:'number'},
                    {label:'存放位置',prop:'position'},
                    {label:'采购人',prop:'cgr'},
                    {label:'采购时间',prop:'cgsj',type:'date'},
                    {label:'规格',prop:'gg'},
                    {label:'单价',prop:'price'},
                ],
                foreignList:{
                    productName:{url:this.apis.stock.QUERY,key:'productName',val:'productName',items:[]},
                },
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
