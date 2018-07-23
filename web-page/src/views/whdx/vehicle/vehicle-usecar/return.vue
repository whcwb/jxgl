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
								<Input v-if="!i.type || i.type ==='text'" type="text" v-model="formItem[i.prop]" :placeholder="'请填写'+i.label+'...'"></Input>
								<DatePicker v-else-if="i.type == 'date'"  :value="formItem[i.prop]" type="date" placeholder="请选择日期" @on-change="(date)=>{formItem[i.prop] = date}"></DatePicker>
								<Select v-else-if="i.type === 'dict'" filterable clearable :disabled="i.disabled"  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in v.dictUtil.getByCode(v,i.dict)' :value="item.key">{{item.val}}</Option>
								</Select>
								<Select v-else-if="i.type === 'foreignKey'" :disabled="i.disabled" filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in foreignList[i.prop].items' :value="item.key">{{item.val}}</Option>
								</Select>
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
				saveUrl:this.apis.userCar.returnCar,
				readonly: false,
				formItem: {
				},
                formInputs:[
                    {label:'车牌',prop:'vId', span:24, type:'foreignKey', disabled:true},
                    {label:'出车时间',prop:'ucCcsj',type:'date'},
                    {label:'还车时间',prop:'ucYjhcsj',type:'date'},
                    {label:'出车事由',prop:'ucCcsy', span:24},
                    {label:'借用人',prop:'ucJyrid',type:'foreignKey', disabled:true},
                    {label:'还车里程数',prop:'unHclcs',required:true},
                    {label:'备注',prop:'ucBz'},
                ],
                foreignList:{
                    vId:{url:this.apis.CAR.QUERY,key:'vId',val:'vHphm',items:[]},
                    ucJyrid:{url:this.apis.USER.QUERY,key:'yhid',val:'xm',items:[]},
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
