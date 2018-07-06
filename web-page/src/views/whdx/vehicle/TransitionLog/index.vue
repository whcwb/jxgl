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

    export default {
        name: 'TransitionLog',
        components: {formData},
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
                    {title:'操作类型',key:'type'},
                    {title:'文件路径',key:'filePath'},
                    // {
                    //     title: '操作',
                    //     key: 'action',
                    //     width: 120,
                    //     fixed: 'right',
                    //     render: (h, params) => {
                    //         return h('div', [
                    //             this.util.buildEditButton(this,h,params),
                    //             this.util.buildDeleteButton(this,h,params.row.id),
                    //         ]);
                    //     }
                    // }
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
        }
    }
</script>
