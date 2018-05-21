<style lang="less">
	@import '../../../../styles/common.less';
</style>

<template>
	<div>
		<Modal v-model="showModal" width='1200' :closable='false'
			:mask-closable="false" :title="'['+formItem.vHphm+']车辆详情'">
			<div style="overflow: auto;height: 500px;">
				<Tabs>
					<Tab-pane label="车辆信息" icon="ios-download-outline">
						<Form
								ref="form"
								:model="formItem"
								:rules="ruleInline"
								:label-width="120"
								:styles="{top: '20px'}">
							<Row>
								<Col span="12">
									<FormItem prop='hphm' label="车牌号">
										<Input v-model="formItem.vHphm" readonly disabled></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="车辆类型">
										<Select filterable disabled v-model="formItem.vHpzl">
											<Option v-for = "(item,index) in dicts.hpzl.items" :value="item.key">{{item.val}}</Option>
										</Select>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="初登日期">
										<Input v-model="formItem.vCcdjrq" readonly disabled></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="年审日期">
										<Input v-model="formItem.vNsrq" readonly disabled></Input>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="所有人">
										<Input v-model="formItem.vSyl" readonly disabled></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="使用性质">
										<Select filterable clearable disabled  v-model="formItem.vSyxz">
											<Option v-for = "(item,index) in dicts.syxz.items" :value="item.key">{{item.val}}</Option>
										</Select>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="车辆品牌">
										<Input v-model="formItem.vClph" readonly disabled></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="车辆型号">
										<Input v-model="formItem.vCllx" readonly disabled></Input>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="车架号">
										<Input v-model="formItem.vCjh" readonly disabled></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="发动机号">
										<Input v-model="formItem.vFdjh" readonly disabled></Input>
									</FormItem>
								</Col>
							</Row>
						</Form>
					</Tab-pane>
					<Tab-pane label="违法记录" icon="ios-download-outline">
						<clxq-wfxx-page :vehcile="formItem"></clxq-wfxx-page>
					</Tab-pane>
					<!--<Tab-pane label="年审记录" icon="ios-download-outline">
						<clxq-nsxx-page></clxq-nsxx-page>
					</Tab-pane>-->
				</Tabs>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
			</div>
		</Modal>
	</div>
</template>

<script>
	//违法详情
    import clxqWfxxPage from './clxqWfxxPage.vue'
    //年审信息
    import clxqNsxxPage from './clxqNsxxPage.vue'
	export default {
		name: 'usecarForm',
		components:{clxqNsxxPage, clxqWfxxPage},
		data() {
			return {
			    v:this,
                saveUrl:this.apis.CAR.CLNS,
				showModal: true,
				readonly: false,
				formItem: {
			        vId:'',
				},
                dicts:{
                    hpzl:{code:'HPZL',items:[]},
                    syxz:{code:'SYXZ',items:[]}
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
