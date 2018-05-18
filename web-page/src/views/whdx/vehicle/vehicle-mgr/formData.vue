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
        name: 'vehicleForm',
        data() {
            return {
                v:this,
                apiRoot :this.apis.CAR,
                operate:'新建',
                showModal: true,
                readonly: false,
                formItem: {
                    px:1,
                    zt:'00'
                },
                formInputs:[
                    {label:'主键ID',prop:'vId',required:true},
                    {label:'车牌号',prop:'vHphm',required:true},
                    {label:'车辆类型',prop:'vHpzl',required:true},
                    {label:'车辆品牌',prop:'vClph',required:true},
                    {label:'车辆型号',prop:'vCllx',required:true},
                    {label:'注册登记日期',prop:'vCcdjrq',required:true},
                    {label:'年审时间.通过登记日期自动计算',prop:'vNsrq',required:true},
                    {label:'所有人',prop:'vSyl',required:true},
                    {label:'使用性质',prop:'vSyxz',required:true},
                    {label:'车架号',prop:'vCjh',required:true},
                    {label:'发动机号',prop:'vFdjh',required:true},
                    {label:'状态',prop:'vZt',required:true},
                    {label:'所属公司代码',prop:'vGsdm',required:true},
                    {label:'所属公司名称',prop:'vGsmc',required:true},
                    {label:'使用人',prop:'vLxr',required:true},
                    {label:'使用人联系电话',prop:'vLxdh',required:true},
                    {label:'保单号码',prop:'vBdhm',required:true},
                    {label:'创建人',prop:'createUser',required:true},
                    {label:'创建时间',prop:'createTime',required:true},
                    {label:'修改人',prop:'updateUser',required:true},
                    {label:'修改时间',prop:'updateTime',required:true},
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
