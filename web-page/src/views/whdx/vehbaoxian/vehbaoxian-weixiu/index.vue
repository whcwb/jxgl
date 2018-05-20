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
			<div style="display: inline-block">
				<label class="searchLabel">最后一次维修时间:</label>
				<DatePicker v-model="dateRange" @on-ok="form.lastRepairTimeInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
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
    import history from './history.vue'

    export default {
        name: 'wxjlTable',
        components: {formData,history},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.repairInfo,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '最后一次维修时间',key:'lastRepairTime'},
                    {title: '最后一次维修项目',key:'lastRepairProject'},
                    {title: '最后一次应付维护费用',key:'lastRepairMoney'},
                    {title: '最后一次保险抵扣费用',key:'lastRepairInsuranceMoney'},
                    {title: '最后一次实付维护费用',key:'lastRepairRealMoney'},
                    {title: '累计维修金额',key:'totalMoney'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'info','wrench','维修',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'formData'
                                }),
                                this.util.buildButton(this,h,'success','compose','历史记录',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'history'
                                }),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    lastRepairTimeInRange:'',
                    orderBy:'lastRepairTime desc',
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
