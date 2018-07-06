<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="true"></search-items>
            <Col span="8">
                <Button type="primary" @click="v.util.getPageData(v)">
                    <Icon type="search"></Icon>
                </Button>
                <Button type="primary" @click="v.util.add(v)">
                    <Icon type="plus-round"></Icon>
                </Button>
            </Col>
        </Row>
        <Row style="position: relative;">
        	<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
        </Row>
        <Row class="margin-top-10 pageSty">
            <Page :total=formItem.total :current=formItem.pageNum :page-size=formItem.pageSize show-total show-elevator @on-change='pageChange'></Page>
        </Row>
        <component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'
    import searchItems from '../../components/searchItems'

    export default {
        name: 'notify',
        components: {formData,searchItems},
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
                    {title:'类型',key:'type',dict:'tzlx'},
                    {title:'通知时间',key:'time'},
                    {title:'内容',key:'content'},
                    {title:'车牌号',key:'cph'},
                    {title:'创建时间',key:'createTime'},
                    {title:'创建人',key:'createUser'},
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
                formItem: {
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
                var v = this
                v.util.getPageData(v);
            },
        }
    }
</script>
