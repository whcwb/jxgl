<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
            <search-items :parent="v" :showCreateButton="true"></search-items>
        </Row>
        <Row style="position: relative;">
        	<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
        </Row>
        <Row class="margin-top-10 pageSty">
			<pager :parent="v"></pager>
        </Row>
        <component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './formData.vue'
    import searchItems from '../../components/searchItems'
    import showDoc from './showDoc'

    export default {
        name: 'TransitionLog',
        components: {formData,searchItems,showDoc},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.jiaojie_log,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'车牌号',key:'cph'},
                    {title:'创建时间',key:'createTime'},
                    {title:'创建人姓名',key:'createUserName'},
                    {title:'操作类型',key:'type',dict:'rkzt'},
                    // {title:'文件路径',key:'filePath'},
                    {
                        title: '操作',
                        key: 'action',
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this, h, 'info', 'eye', '单据查看', ()=>{this.showDoc(params.row)}),
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
            showDoc(o){
                this.choosedRow = o;
                this.componentName = 'showDoc';
            }
        }
    }
</script>
