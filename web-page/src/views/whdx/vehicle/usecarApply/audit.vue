<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="true"></search-items>
            <Button type="primary" @click="v.util.getPageData(v)">
                <Icon type="search"></Icon>
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
    import rejectReason from './rejectReason.vue'
    import searchItems from '../../components/searchItems'
    import swal from 'sweetalert2'

    export default {
        name: 'usecarApply',
        components: {formData, searchItems,rejectReason},
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
                            let buttons = [];
                            if (params.row.zt === '0'){
                                buttons.push(
                                    h('Button', {
                                        props: {
                                            type: 'success',
                                            size: 'small'
                                        },
                                        style: {
                                            marginRight: '5px'
                                        },
                                        on: {
                                            click: () => {
                                                this.choosedItem = params.row
                                                this.pass(params.row.id)
                                            }
                                        }
                                    },'通过'),
                                    h('Button', {
                                        props: {
                                            type: 'error',
                                            size: 'small'
                                        },
                                        style: {
                                            marginRight: '5px'
                                        },
                                        on: {
                                            click: () => {
                                                this.choosedItem = params.row
                                                this.reject(params.row.id)
                                            }
                                        }
                                    },'驳回'),
                                )
                            }
                            return h('div',buttons);
                        }
                    }
                ],
                pageData: [],
                form: {
                    zt:'0',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                bhyy:''
            }
        },
        created() {
            this.util.initTable(this)
        },
        methods: {
            pass(id){
                swal({
                    title: "审核通过?",
                    text: "",
                    icon: "success",
                    showCancelButton: true,
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                }).then((confirm) => {
                    if (confirm) {
                        this.audit(id,'1');
                    }
                });
            },
            reject(id){
                this.componentName = 'rejectReason'
            },
            rejectConfirm(reason){
                this.bhyy = reason;
                this.audit(this.choosedItem.id,'2');

            },
            audit(id,zt){
                let param = {
                    state:zt,
                    id:id,
                    reason:this.bhyy
                }
                this.$http.post(this.apis.useCarApply.AUDIT,param).then((res) =>{
                    if (res.code === 200){
                        this.componentName = ''
                        this.$Message.success(res.message);
                        this.util.getPageData(this);
                    }else{
                        this.$Message.error(res.message);
                    }
                })
            },
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
