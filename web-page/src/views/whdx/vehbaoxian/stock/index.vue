<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="true"></search-items>
        </Row>
        <Row style="position: relative;">
        	<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
        </Row>
        <Row class="margin-top-10 pageSty">
			<pager :parent="v"></pager>
        </Row>
        <component :is="componentName"></component>
	</div>
</template>

<script>
    import searchItems from '../../components/searchItems'
    import pager from '../../components/pager'
    import formData from './formData.vue'
    import showLog from '../stockLog/productLog'


    export default {
        name: 'stock',
        components: {formData,searchItems,pager,showLog},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.stock,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'商品编码',key:'productCode'},
                    {title:'商品名称',key:'productName',searchKey:'productNameLike'},
                    {title:'规格',key:'gg'},
                    {title:'单价',key:'price'},
                    {title:'剩余数量',key:'number'},
                    {title:'存放位置',key:'position'},
                    {title:'更新时间',key:'updateTime'},
                    {title:'更新人',key:'updateUser'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'success','eye','历史记录',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'showLog'
                                }),
                                this.util.buildEditButton(this,h,params),
                                this.util.buildDeleteButton(this,h,params.row.id),
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
        }
    }
</script>
