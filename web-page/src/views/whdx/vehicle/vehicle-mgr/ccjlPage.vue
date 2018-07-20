<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
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
    import Cookies from 'js-cookie';
    export default {
        name: 'insuranceForm',
        props:{
            vehcile:{
                type:Object,
                default:{}
            }
        },
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
                    {title:'出车时间',key:'ucCcsj',searchKey:'ucCcsjInRange',searchType:'daterange'},
                    {title:'预计还车时间',key:'ucYjhcsj',
                        render:(h,p)=>{
                            if (p.row.unHclcs != ''){
                                return h('div',p.row.ucYjhcsj);
                            }
                            let f = this.today >= p.row.ucYjhcsj;
                            if (!f){
                                return h('div',p.row.ucYjhcsj);
                            }
                            return h('div',{style:{color:'red'}},p.row.ucYjhcsj)
                        }
                    },
                    {title:'驾驶员',key:'ucJyr'},
                    {title:'出车前里程数',key:'ucCclcs'},
                    {title:'还车里程数',key:'unHclcs'},
                    {title:'出车事由',key:'ucCcsy'},
                    {title:'备注',key:'ucBz'},
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
                            if (!f){
                                return h('Tag', {
                                    props: {
                                        type: 'dot',
                                        color: 'red'
                                    }
                                }, '未还车');
                            }
                            return h('Tag', {
                                props: {
                                    type: 'dot',
                                    color: 'red'
                                }
                            }, '超出预计时间');
                        }},
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
            this.form.vId = this.vehcile.vId;
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

<style scoped>
	.demo-upload-list{
		display: inline-block;
		width: 120px;
		height: 100px;
		text-align: center;
		line-height: 100px;
		border: 1px solid transparent;
		border-radius: 4px;
		overflow: hidden;
		background: #fff;
		position: relative;
		box-shadow: 0 1px 1px rgba(0,0,0,.2);
		margin-right: 4px;
	}
	.demo-upload-list img{
		width: 100%;
		height: 100%;
	}
	.demo-upload-list-cover{
		display: none;
		position: absolute;
		top: 0;
		bottom: 0;
		left: 0;
		right: 0;
		background: rgba(0,0,0,.6);
	}
	.demo-upload-list:hover .demo-upload-list-cover{
		display: block;
	}
	.demo-upload-list-cover i{
		color: #fff;
		font-size: 20px;
		cursor: pointer;
		margin: 0 8px;
	}
</style>
