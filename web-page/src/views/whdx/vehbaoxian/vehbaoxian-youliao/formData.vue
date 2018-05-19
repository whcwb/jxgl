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
								<Input v-if="!i.type || i.type =='text'" type="text" v-model="formItem[i.prop]" :placeholder="'请填写'+i.label+'...'"></Input>
								<Select v-if="i.type == 'dict'" filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in dicts[i.prop].items' :value="item.key">{{item.val}}</Option>
								</Select>
								<Select v-if="i.type == 'foreignKey'" filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
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
		name: 'yljlForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
                    ylCzlx:'20',// 消费
				},
                formInputs:[
                    {label:'油卡卡号',prop:'ykId',type:'foreignKey'},
                    {label:'油料类型',prop:'ylYllx',type:'dict'},
                    {label:'油料容量',prop:'ylYlrs'},
                    {label:'金额',prop:'ylJe'},
                    {label:'车辆id',prop:'vId'},
                    {label:'车牌号',prop:'vHphm'},
                    {label:'备注',prop:'ylBz'},
                ],
                ruleInline:{
				},
				dicts:{
                    ylYllx:{code:'yllx',items:[]},
                    ylCzlx:{code:'ylCzlx',items:[]},
				},
				foreignList:{
                    ykId:{url:this.apis.OIL_CARD.QUERY,key:'ykId',val:'ykId',items:[]}
				}
			}
		},
		created(){
		    this.util.initFormModal(this);
		    this.util.initDict(this);
		    this.util.initForeignKeys(this);
		},
		methods: {
		}
	}
</script>

<style>

</style>
