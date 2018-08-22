<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="false"></search-items>
        </Row>
        <Row style="position: relative;">
        	<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
        </Row>
        <Row class="margin-top-10 pageSty">
            <Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>
        </Row>
        <component :is="componentName"></component>
	</div>
</template>

<script>
    import searchItems from '../../components/searchItems'

    export default {
        name: 'notify',
        components: {searchItems},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.notify,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'车牌号',key:'cph',searchKey:'cphLike'},
                    {title:'类型',key:'type',dict:'tzlx',searchType:'dict'},
                    {title:'通知时间',key:'time',searchType:'daterange'},
                    {title:'通知人姓名',key:'toUserName'},
                    {title:'通知人电话',key:'toUserPhone'},
                    {title:'内容',key:'content'},
                    {
                        title: '操作',
                        key: 'action',
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
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
            let now = new Date().format("yyyy-MM-dd hh:mm:ss");
            this.form.timeGte = now;
            this.util.initTable(this)
        },
        methods: {
            pageChange(event) {
                var v = this
                v.util.getPageData(v);
            },
        }
    }
</script>
