<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<search-items :parent="v"></search-items>
			<Button type="primary" @click="v.util.getPageData(v)"><Icon type="search"></Icon></Button>
			<Button type="primary" @click="v.util.add(v)"><Icon type="plus-round"></Icon></Button>
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
    import returnForm from './return.vue'
	import searchItems from '../../components/searchItems'

    export default {
        name: 'usecar',
        components: {formData,returnForm,searchItems},
        data() {
            return {
                v:this,
                dateRange:'',
                SpinShow: true,
                apiRoot:this.apis.userCar,
				today:'',
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title:'车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title:'出车时间',key:'ucCcsj',searchKey:'ucCcsjInRange',searchType:'daterange'},
                    {title:'预计还车时间',key:'ucYjhcsj',
						render:(h,p)=>{
                        	if (p.row.unHclcs != ''){
                        	    return h('div',p.row.ucYjhcsj);
							}
                            let f = this.today >= p.row.ucYjhcsj;
                        	return h('div',{style:{color:'red'}},p.row.ucYjhcsj)
						}
					},
                    {title:'借用人',key:'ucJyr'},
                    {title:'出车前里程数',key:'ucCclcs'},
                    {title:'还车里程数',key:'unHclcs'},
                    {title:'出车事由',key:'ucCcsy'},
                    {title:'状态',render:(h,p)=>{
                        if (p.row.unHclcs != ''){
                            return h('Tag', {
                                props: {
                                    type: 'dot',
                                    color: 'blue'
                                }
                            }, '已还车');
                        }
                        let f = this.today >= p.row.ucYjhcsj;
                        return h('Tag', {
                            props: {
                                type: 'dot',
                                color: 'red'
                            }
                        }, '超出预计时间');
                    }},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            let buttons = [];
                            if (params.row.unHclcs === ''){
                                buttons.push(this.util.buildButton(this, h, 'info', 'ios-download-outline', '还车', ()=> {
                                    this.choosedItem = params.row;
                                    this.componentName = 'returnForm';
                                }))
							}
                            return h('div', buttons);
                        }
                    }
                ],
                pageData: [],
                form: {
                    orderBy:'ucCcsj desc',
                    ucCcsjInRange:'',
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
