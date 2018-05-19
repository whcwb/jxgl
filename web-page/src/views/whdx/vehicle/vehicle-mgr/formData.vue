<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			   :mask-closable="false" :title="operate+'车辆'">
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
        name: 'vehicleForm',
        data() {
            return {
                v:this,
                operate:'新建',
                showModal: true,
                readonly: false,
                formItem: {
                },
                formInputs:[
                    {label:'车牌号',prop:'vHphm',required:true},
                    {label:'车辆类型',prop:'vHpzl'},
                    {label:'车辆品牌',prop:'vClph'},
                    {label:'车辆型号',prop:'vCllx'},
                    {label:'注册登记日期',prop:'vCcdjrq'},
                    {label:'所有人',prop:'vSyl'},
                    {label:'使用性质',prop:'vSyxz'},
                    {label:'车架号',prop:'vCjh'},
                    {label:'发动机号',prop:'vFdjh'},
                    {label:'状态',prop:'vZt'},
                    {label:'所属公司代码',prop:'vGsdm'},
                    {label:'所属公司名称',prop:'vGsmc'},
                    {label:'使用人',prop:'vLxr'},
                    {label:'使用人联系电话',prop:'vLxdh'},
                    {label:'保单号码',prop:'vBdhm'},
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
