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
    import history from './history.vue'
	import searchItems from '../../components/searchItems'

    export default {
        name: 'byxxTable',
        components: {formData,history,searchItems},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.maintainInfo,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '最后一次保养时间',key:'byBysj',searchKey:'byBysjInRange',searchType:'daterange'},
                    {title: '最后一次保养金额',key:'byByje',unit:'元'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'info','ios-color-wand','保养',()=>{
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
                    byBysjInRange:'',
                    orderBy:'byBysj desc',
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
