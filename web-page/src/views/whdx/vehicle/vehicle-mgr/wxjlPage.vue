<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Row style="padding-bottom: 16px;">
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
                apiRoot:this.apis.repair,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '维修项目',key:'project'},
                    {title: '维修时间',key:'createTime'},
                    {title: '维修应付金额',key:'money',unit:'元'},
                    {title: '保险报销金额',key:'insuranceMoney',unit:'元'},
                    {title: '维修实付金额',key:'realMoney',unit:'元'},
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
            this.form.vId = this.vehcile.vId;
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
