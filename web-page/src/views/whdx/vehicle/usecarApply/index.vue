<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="true"></search-items>
            <Button type="primary" @click="v.util.getPageData(v)">
                <Icon type="search"></Icon>
            </Button>
            <Button type="primary" @click="v.util.add(v)">
                <Icon type="plus-round"></Icon>
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
    import searchItems from '../../components/searchItems'
    export default {
        name: 'usecarApply',
        components: {formData, searchItems},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.useCarApply,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'车牌号',key:'cph',searchKey:'cphLike'},
                    {title:'车辆id',key:'clId'},
                    {title:'申请人id',key:'sqrId'},
                    {title:'申请原因',key:'sqyy'},
                    {title:'申请人姓名',key:'sqrxm'},
                    {title:'申请时间',key:'createTime'},
                    {title:'状态',key:'zt',dict:'ycsqzt',searchType:'dict'},
                    {title:'审核人',key:'shr'},
                    {title:'审核时间',key:'shsj'},
                    {title:'驳回原因',key:'bhyy'},
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
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
