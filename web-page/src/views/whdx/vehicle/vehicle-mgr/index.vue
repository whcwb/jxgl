<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<div v-for="r in tableColumns" v-if="r.searchKey" style="display: inline-block">
				<label class="searchLabel">{{r.title}}:</label>
				<Input v-model="form[r.searchKey]" :placeholder="'请输入'+r.title" style="width: 200px"></Input>
			</div>
			<Button type="primary" @click="v.util.getPageData(v)">
				<Icon type="search"></Icon>
			</Button>
			<Button type="primary" @click="v.util.add(v)">
				<Icon type="plus-round"></Icon>
			</Button>
		</Row>
		<Row style="position: relative;">
			<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<Row class="margin-top-10 pageSty">
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
				  @on-change='pageChange'></Page>
		</Row>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'

    export default {
        name: 'vehicleTable',
        components: {formData},
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
                    {title: '车辆类型',key:'vHpzl',searchKey:'vHpzl'},
                    {title: '车辆品牌',key:'vClph',searchKey:'vClph'},
                    {title: '车辆型号',key:'vCllx',searchKey:'vCllx'},
                    {title: '注册登记日期',key:'vCcdjrq'},
                    {title: '所有人',key:'vSyl'},
                    {title: '使用性质',key:'vSyxz'},
                    {title: '车架号',key:'vCjh'},
                    {title: '发动机号',key:'vFdjh'},
                    {title: '状态',key:'vZt'},
                    {title: '所属公司代码',key:'vGsdm'},
                    {title: '所属公司名称',key:'vGsmc'},
                    {title: '使用人',key:'vLxr'},
                    {title: '使用人联系电话',key:'vLxdh'},
                    {title: '保单号码',key:'vBdhm'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildDeleteButton(this,h,params.row.vId),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
            }
        },
        created() {
            this.util.initTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
