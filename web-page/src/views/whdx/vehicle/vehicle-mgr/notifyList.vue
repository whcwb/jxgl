<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Row style="padding-bottom: 16px;">
            <search-items :parent="v" ></search-items>
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
        props:{
            vehcile:{
                type:Object,
                default:{}
            }
        },
        data() {
            return {
                v:this,
                showModal:true,
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
                    {title:'内容',key:'content'},
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
            this.form.clId = this.vehcile.vId;
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
