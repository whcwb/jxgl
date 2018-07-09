<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Row style="padding-bottom: 16px;">
            <search-items :parent="v"></search-items>
            <Button type="primary" @click="v.util.getPageData(v)"><Icon type="search"></Icon></Button>
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
    import formData from './formData'

    export default {
        name: 'usecar',
        components: {searchItems,formData},
        data() {
            return {
                v:this,
                dateRange:'',
                SpinShow: true,
                apiRoot:this.apis.CAR,
                today:'',
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title:'车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title:'责任人',key:'vZrr'},
                    {title:'责任人联系电话',key:'vZrrlxdh'},
                    {title:'价值',key:'vWorth'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 150,
                        render: (h, params) => {
                            let buttons = [
                                this.util.buildEditButton(this,h,params),
                            ];
                            return h('div', buttons);
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
            this.today = new Date().format("yyyy-MM-dd");
            this.util.initTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
