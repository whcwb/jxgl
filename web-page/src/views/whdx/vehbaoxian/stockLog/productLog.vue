<template>
	<div class="boxbackborder">
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" title="历史记录">
            <div style="overflow: auto;height: 500px;">
                <Row style="position: relative;">
                    <Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
                </Row>
                <Row class="margin-top-10 pageSty">
                    <pager :parent="v"></pager>
                </Row>
            </div>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
                <Button type="primary" @click="v.util.save(v)">确定</Button>
            </div>
        </Modal>
	</div>
</template>

<script>
    import formData from './formData.vue'
    import pager from '../../components/pager'
    import searchItems from '../../components/searchItems'

    export default {
        name: 'stockLog',
        components: {formData,pager,searchItems},
        data() {
            return {
                v:this,
                showModal:true,
                SpinShow: true,
                apiRoot:this.apis.stockLog,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'商品名称',key:'productName'},
                    {title:'商品编码',key:'productCode'},
                    {title:'更新之前数量',key:'beforeUpdate'},
                    {title:'更新之后数量',key:'afterUpdate'},
                    {title:'创建时间',key:'createTime'},
                    {title:'创建人',key:'createUser'},
                    {title:'备注',key:'remark'},
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
            this.form.productName = this.$parent.choosedItem.productName;
            this.util.initTable(this)
        },
        methods: {
        }
    }
</script>
