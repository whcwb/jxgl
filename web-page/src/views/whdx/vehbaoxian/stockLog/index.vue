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
    import formData from './formData.vue'

    export default {
        name: 'stockLog',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.stockLog,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'库存id',key:'stockId'},
                    {title:'更新之前数量',key:'beforeUpdate'},
                    {title:'更新之后数量',key:'afterUpdate'},
                    {title:'创建时间',key:'createTime'},
                    {title:'创建人',key:'createUser'},
                    {title:'备注',key:'remark'},
                    {title:'商品名称',key:'productName'},
                    {title:'商品编码',key:'productCode'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
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
