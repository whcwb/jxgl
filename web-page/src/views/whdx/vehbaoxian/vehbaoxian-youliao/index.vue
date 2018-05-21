<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<search-items :parent="v"></search-items>
			<Button type="primary" @click="v.util.getPageData(v)">
				<Icon type="search"></Icon>
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
    import searchItems from '../../components/searchItems'

    export default {
        name: 'vehicleTable',
        components: {formData,searchItems},
        data() {
            return {
                v:this,
                SpinShow: true,
				pagerUrl:this.apis.oilRecord.list,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '最后一次加油时间',key:'lastFuelTime',searchKey:'lastFuelTimeInRange',searchType:'daterange'},
                    {title: '最后一次加油金额',key:'lastFuelMoney',unit:'元'},
                    {title: '最后一次加油容量',key:'lastFuelCapacity',unit:'L'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'success','plus','加油',()=>{
									this.choosedItem = params.row;
									this.componentName = 'formData';
								}),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    lastFuelTimeInRange:'',
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
