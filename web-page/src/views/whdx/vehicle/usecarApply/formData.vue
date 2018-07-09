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
    import Cookies from 'js-cookie';
	export default {
		name: 'usecarApplyForm',
        components:{formItems},
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'车辆',prop:'clId',type:'foreignKey'},
                    {label:'申请原因',prop:'sqyy'},
                    {label:'申请人',prop:'sqrId',type:'foreignKey'},
                    {label:'申请时间',prop:'sqsj',type:'datetime'},
                ],
                ruleInline:{
				},
                foreignList:{
                    clId:{url:this.apis.CAR.QUERY,key:'vId',val:'vHphm',items:[]},
                    sqrId:{url:this.apis.USER.QUERY,key:'yhid',val:'xm',items:[]},
                },
                curUser:'',
			}
		},
		created(){
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
		    this.util.initFormModal(this);
            this.formItem.sqrId = this.curUser.userId;
            this.formItem.sqsj = new Date().format("yyyy-MM-dd HH:mm:SS");
		},
		methods: {
		}
	}
</script>

<style>

</style>
