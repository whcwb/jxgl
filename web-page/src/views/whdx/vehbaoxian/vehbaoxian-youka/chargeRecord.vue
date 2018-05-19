<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<div v-for="r in tableColumns" v-if="r.searchKey" style="display: inline-block">
				<label class="searchLabel">{{r.title}}:</label>
				<Input v-model="form[r.searchKey]" :placeholder="'请输入'+r.title" style="width: 200px"></Input>
			</div>
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

    export default {
        name: 'yljlTable',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.oilRecord,
                tableHeight: 320,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '操作类型',key:'ylCzlx'},
                    {title: '油卡卡号',key:'ykId',searchKey:'ykIdLike'},
                    {title: '油料类型',key:'ylYllx'},
                    {title: '油料容量',key:'ylYlrs'},
                    {title: '金额',key:'ylJe'},
                    {title: '车辆id',key:'vId'},
                    {title: '车牌号',key:'vHphm'},
                    {title: '操作时间',key:'ylCzsj'},
                    {title: '备注',key:'ylBz'},
                ],
                pageData: [],
                form: {
                    ylCzlx:'10',
                    total: 0,
                    pageNum: 1,
                    pageSize: 5,
                },
            }
        },
        created() {
            this.util.initModalTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
