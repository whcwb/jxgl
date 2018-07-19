<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<search-items :parent="v" :showSearchButton="true"></search-items>
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
    import formData from './formData.vue'
	import searchItems from '../../components/searchItems'
	import printForm from './printForm'
	import uploadForm from './uploadForm'
    import swal from 'sweetalert2'
    import Print from 'print-js'
    export default {
        name: 'usecar',
        components: {formData,searchItems,printForm,uploadForm},
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
                    {title:'车辆类型',key:'vHpzl',searchType:'dict',dict:'HPZL'},
                    {title:'责任人',key:'vZrr',searchKey:'vZrrLike'},
                    {title:'使用人',key:'vLxr',searchKey:'vLxrLike'},
                    {title:'使用人联系电话',key:'vLxdh',searchKey:'vLxdhLike'},
                    {title:'出入库状态',key:'vRkzt',dict:'rkzt',searchType:'dict'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 150,
                        render: (h, params) => {
                            let buttons = [
                                // this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this, h, 'info', 'printer', '单据打印', ()=>{this.printForm(params.row)}),
                                this.util.buildButton(this, h, 'info', 'arrow-up-a', '单据回传', ()=>{this.uploadForm(params.row)}),
							];
                            return h('div', buttons);
                        }
                    }
                ],
                dicts:{
                    rkzt:{code:'rkzt',items:[]},
                    HPZL:{code:'HPZL',items:[]}
                },
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
			printForm(o){
                this.choosedRow = o;
                this.componentName = 'printForm';
            },
			uploadForm(o){
                this.choosedRow = o;
                this.componentName = 'uploadForm';
			},
        }
    }
</script>
