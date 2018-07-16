<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <Modal v-model="showModal" width='900' :closable='false'
           :mask-closable="false" title="联系记录">
        <div style="overflow: auto;height: 500px;">
            <div class="boxbackborder">
                <Row style="padding-bottom: 16px;">
                    <search-items :parent="v" :showCreateButton="true"></search-items>
                    <div style="display: inline-block">
                        <Button type="primary" @click="v.util.getPageData(v)">
                            <Icon type="search"></Icon>
                        </Button>
                        <Button type="primary" @click="v.util.add(v)">
                            <Icon type="plus-round"></Icon>
                        </Button>
                    </div>
                </Row>
                <Row style="position: relative;">
                    <Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
                </Row>
                <Row class="margin-top-10 pageSty">
                    <Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>
                </Row>
                <component :is="componentName"></component>
            </div>
        </div>
        <div slot='footer'>
            <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
        </div>
    </Modal>

</template>

<script>
    import searchItems from '../../components/searchItems'

    export default {
        name: 'notify',
        components: {searchItems},
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
                    {title:'通知时间',key:'time',searchType:'daterange'},
                    {title:'内容',key:'content'},
                    {title:'车牌号',key:'cph',searchKey:'cphLike'},
                ],
                pageData: [],
                form: {
                    type:'3',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
            }
        },
        created() {
            this.form.vId = this.$parent.choosedItem.vId;
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
