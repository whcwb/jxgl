<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
		<Row  justify="space-between">
			<Col span="5">
				<FormItem label="车牌号">
					<Input v-model="form.vHphmLike" placeholder="请输入车牌号" ></Input>
				</FormItem>
			</Col>
			<Col span="5">
				<FormItem label="车辆类型">
					<Select filterable clearable  v-model="form.vHpzl" placeholder="请选择车辆类型...">
						<Option v-for = '(item,index) in dicts.hpzl.items' :value="item.key">{{item.val}}</Option>
					</Select>
				</FormItem>
			</Col>
			<Col span="5">
				<FormItem label="使用人">
					<Input v-model="form.vLxrLike" placeholder="请输入使用人" ></Input>
				</FormItem>
			</Col>
			<Col span="4" offset="1">
				<Button type="primary" @click="v.util.getPageData(v)">
					<Icon type="search"></Icon>
				</Button>
				<Button type="primary" @click="v.util.add(v)">
					<Icon type="plus-round"></Icon>
				</Button>
			</Col>
		</Row>
		<Row style="position: relative;">
			<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<Row class="margin-top-10 pageSty">
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
				  @on-change='pageChange'></Page>
		</Row>
		</Form>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'
	//分配人员
    import allocPerson from './allocPerson.vue'
    //证件查看
    import showPhoto from './addlistfileImg.vue'
    //车辆年审
    import clnsForm from './clnsForm.vue'
    //车辆详情
    import clxqPage from './clxqPage.vue'

    export default {
        name: 'vehicleTable',
        components: {formData, allocPerson, showPhoto, clnsForm, clxqPage},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.CAR,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '车牌号',key:'vHphm',searchKey:'vHphm'},
                    {title: '车辆类型',key:'vHpzl',render:(h, params)=>{
                        let val = $.map(this.dicts.hpzl.items, item => {
                            if(item.key == params.row.vHpzl) {
                                return item.val;
                            }
                        });
                        return val;
                    }},
                    {title: '注册登记日期',key:'vCcdjrq'},
                    {title: '年审日期',width:180,key:'vNsrq',render:(h, params)=>{
							let today = new Date().format("yyyy-MM-dd");
							let f = today >= params.row.vNsrq;
							let content = "请尽快完成年审";
							let color = "red";
							if (!f){
								color = "green";
								content = "暂不需要年审";
							}

							return h('Tooltip', {
								props: {
									trigger: 'hover',
									content: content,
									placement: 'bottom'
								}
							},[
								h('Tag', {
									props: {
										type: 'dot',
										color: color
									}
								}, params.row.vNsrq)
							]);
						},
                        filters: [
                            {
                                label: '超期未年审',
                                value: 1
                            }
                        ],
                        filterMultiple: false,
                        filterMethod (value, row) {
                            let today = new Date().format("yyyy-MM-dd");
                            let f = today >= row.vNsrq;
                            if (!f){
                                return false;
                            }

                            return true;
                        }
                    },
                    {title: '所有人',key:'vSyl'},
                    /*{title: '使用性质',key:'vSyxz',render:(h, params)=>{
                        let val = $.map(this.dicts.syxz.items, item => {
                            if(item.key == params.row.vSyxz) {
                                return item.val;
                            }
                        });
                        return val;
                    }},*/
                    {title: '车架号', width: 120,key:'vCjh'},
                    /*{title: '发动机号',key:'vFdjh'},*/
                    {title: '使用人',key:'vLxr',render:(h, params)=>{
                        let lxr = params.row.vLxr;

                        if (lxr){
                            lxr = lxr.split("-")[1];
						}else{
                            lxr = '-';
						}
                        return h('div', lxr);
                    }},
                    {
                        title: '操作',
                        key: 'action',
                        width: 220,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this, h, 'info', 'ios-list-outline', '车辆详情', ()=>{this.showClxqPage(params)}),
                                this.util.buildButton(this, h, 'info', 'calendar', '车辆年审', ()=>{this.showNsPage(params)}),
                                this.util.buildButton(this, h, 'info', 'person', '车辆分配', ()=>{this.toPerson(params)}),
                                this.util.buildButton(this, h, 'info', 'ios-eye', '证件照片', ()=>{this.showImgFile(params)}),

                                this.util.buildDeleteButton(this,h,params.row.vId),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    vHphmLike:'',
					vHpzl:'',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                dicts:{
                	hpzl:{code:'HPZL',items:[]},
                    syxz:{code:'SYXZ',items:[]}
            	}
            }
        },
        created() {
            this.util.initTable(this);
            this.util.initDict(this);
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
			//车辆分配
			toPerson(param){
                this.choosedItem = param.row;
                this.componentName = 'allocPerson';
			},
            //证件照片
            showImgFile(param){
                this.choosedItem = param.row;
                this.componentName = 'showPhoto';
            },
            //车辆年审界面
            showNsPage(param){
                this.choosedItem = param.row;
                this.componentName = 'clnsForm';
            },
            //车辆详情
            showClxqPage(param){
                this.choosedItem = param.row;
                this.componentName = 'clxqPage';
            }
        }
    }
</script>
