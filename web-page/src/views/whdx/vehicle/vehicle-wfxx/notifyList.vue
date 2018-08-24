<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='1200' :closable='false'
			:mask-closable="false" :title="operate+''">
			<div style="overflow: auto;height: 500px;">
				<div class="boxbackborder">
					<Row style="padding-bottom: 16px;">
						<search-items :parent="v" :showCreateButton="true"></search-items>
					</Row>
					<Row style="position: relative;">
						<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
					</Row>
					<Row class="margin-top-10 pageSty">
						<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>
					</Row>
				</div>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
			</div>
		</Modal>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import formData from './addNotify'
    import searchItems from '../../components/searchItems'
	export default {
        name: 'notify',
        components: {searchItems,formData},
		data() {
			return {
			    v:this,
                operate:'联系记录',
				showModal: true,
				readonly: false,
                tableHeight: 320,
                componentName:'',
                apiRoot:this.apis.notify,
                tableColumns: [
                    {title: "#", width: 60, type: 'index'},
                    {title:'车牌号',key:'cph',searchKey:'cphLike'},
                    {title:'通知时间',key:'time',searchType:'daterange'},
                    {title:'通知人姓名',key:'toUserName'},
                    {title:'通知方式',key:'method',dict:'tzfs'},
                    {title:'内容',width: 560, key:'content'},
                ],
                pageData: [],
                form: {
                    type:'2',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
			}
		},
		created(){
            this.form.clId = this.$parent.choosedItem.vId;
            this.util.initTable(this)
		},
        methods: {
            add(){
                this.componentName = 'addNotify'
            },
            pageChange(event) {
                var v = this
                v.util.getPageData(v);
            },
        }
	}
</script>

<style scoped>
	.demo-upload-list{
		display: inline-block;
		width: 60px;
		height: 60px;
		text-align: center;
		line-height: 60px;
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
		margin: 0 2px;
	}
</style>

