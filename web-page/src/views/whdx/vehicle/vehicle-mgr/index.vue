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

    export default {
        name: 'vehicleTable',
        components: {formData, allocPerson},
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
                    {title: '所有人',key:'vSyl'},
                    {title: '使用性质',key:'vSyxz',render:(h, params)=>{
                        let val = $.map(this.dicts.syxz.items, item => {
                            if(item.key == params.row.vSyxz) {
                                return item.val;
                            }
                        });
                        return val;
                    }},
                    {title: '车架号',key:'vCjh'},
                    {title: '发动机号',key:'vFdjh'},
                    {title: '使用人',key:'vLxr'},
                    {title: '使用人联系电话',key:'vLxdh'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this, h, 'info', 'person', '车辆分配', ()=>{this.toPerson(params)}),
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
			}
        }
    }
</script>
