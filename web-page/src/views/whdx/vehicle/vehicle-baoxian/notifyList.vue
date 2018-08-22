<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div>
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" title="联系记录">
            <div style="overflow: auto;height: 500px;">
                <div class="boxbackborder">
                    <Row style="padding-bottom: 16px;">
                        <search-items :parent="v" :showCreateButton="true"></search-items>
                    </Row>
                    <Row style="position: relative;">
                        <Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
                    </Row>
                    <Row class="margin-top-10 pageSty">
                        <Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>
                    </Row>
                </div>
            </div>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
            </div>
        </Modal>
        <component :is="componentName"></component>
    </div>


</template>

<script>
    import searchItems from '../../components/searchItems'
    import addNotify from './addNotify'

    export default {
        name: 'notify',
        components: {searchItems,addNotify},
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
                    {title:'通知时间',key:'time',searchType:'daterange'},
                    {title:'通知人姓名',key:'toUserName'},
                    {title:'通知人电话',key:'toUserPhone'},
                    {title:'内容',key:'content'},
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
            this.form.clId = this.$parent.choosedItem.vId;
            this.util.initTable(this)
        },
        methods: {
            add(){
                this.componentName = 'addNotify'
            },
            pageChange(event) {
                var v = this
                v.util.getPageData(v);
            },
        }
    }
</script>
