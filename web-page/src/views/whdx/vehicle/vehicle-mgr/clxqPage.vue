<style lang="less">
	@import '../../../../styles/common.less';
	.clxqPage{
		background-color: #f8f8f9;
	}
</style>

<template>
	<div id="clxqPage">
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
										<Input v-model="formItem.vHphm" readonly ></Input>
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
										<Input v-model="formItem.vCcdjrq" readonly ></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="年审日期">
										<Input v-model="formItem.vNsrq" readonly ></Input>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="所有人">
										<Input v-model="formItem.vSyl" readonly ></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="使用性质">
										<Select filterable  disabled  v-model="formItem.vSyxz">
											<Option v-for = "(item,index) in dicts.syxz.items" :value="item.key">{{item.val}}</Option>
										</Select>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="车辆品牌">
										<Input v-model="formItem.vClph" readonly ></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="车辆型号">
										<Input v-model="formItem.vCllx" readonly ></Input>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="车架号">
										<Input v-model="formItem.vCjh" readonly ></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="发动机号">
										<Input v-model="formItem.vFdjh" readonly ></Input>
									</FormItem>
								</Col>
							</Row>
							<Row>
								<Col span="12">
									<FormItem  label="责任人">
										<Input v-model="formItem.vZrr" readonly ></Input>
									</FormItem>
								</Col>
								<Col span="12">
									<FormItem  label="责任人联系电话">
										<Input v-model="formItem.vZrrlxdh" readonly ></Input>
									</FormItem>
								</Col>
							</Row>
						</Form>
					</Tab-pane>
					<Tab-pane label="违法记录" icon="ios-download-outline">
						<clxq-wfxx-page :vehcile="formItem"></clxq-wfxx-page>
					</Tab-pane>
					<Tab-pane label="年审记录" icon="ios-download-outline">
						<clxq-nsxx-page :vehcile="formItem"></clxq-nsxx-page>
					</Tab-pane>
					<Tab-pane label="责任人变更记录" icon="ios-download-outline">
						<clxq-zrr-page :vehcile="formItem"></clxq-zrr-page>
					</Tab-pane>
					<Tab-pane label="联系记录" icon="ios-download-outline">
						<notify-list :vehcile="formItem"></notify-list>
					</Tab-pane>
					<Tab-pane label="保险记录" icon="ios-download-outline">
						<bxjl-page :vehcile="formItem"></bxjl-page>
					</Tab-pane>
					<Tab-pane label="维修记录" icon="ios-download-outline">
						<wxjl-page :vehcile="formItem"></wxjl-page>
					</Tab-pane>
					<Tab-pane label="保养记录" icon="ios-download-outline">
						<byjl-page :vehcile="formItem"></byjl-page>
					</Tab-pane>
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
	// 联系记录
	import notifyList from './notifyList'
    //保险记录
    import bxjlPage from './bxjlPage.vue'
    //维修记录
    import wxjlPage from './wxjlPage.vue'
    //保养记录
    import byjlPage from './byjlPage.vue'
    //责任人信息
    import clxqZrrPage from './clxqZrrPage.vue'
	export default {
		name: 'usecarForm',
		components:{clxqNsxxPage, clxqWfxxPage,clxqZrrPage,notifyList,bxjlPage,wxjlPage,byjlPage},
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
                },
                ruleInline:{}
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
