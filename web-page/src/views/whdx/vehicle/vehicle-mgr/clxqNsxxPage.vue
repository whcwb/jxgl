<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row justify="space-between">
				<Col span="4" offset="1">
					<Button type="primary" @click="v.util.getPageData(v)">
						<Icon type="search"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
		<Row style="position: relative;">
			<Table height="300" :columns="tableColumns" :data="pageData"></Table>
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
        name: 'wfxx',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.illegal,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'车牌号码',key:'vHphm'},
                    {title:'违法编号',key:'wfId'},
                    {title:'违法时间',key:'wfWfsj'},
                    {title:'违法地点',key:'wfWfdz'},
                    {title:'违法行为',key:'wfWfxw'},
                    {title:'违法记分',key:'wfWfjf'},
                    {title:'违法金额',key:'wfWfje'}
                ],
                pageData: [],
                form: {
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                dicts:{
                    wfzt:{code:'WFZT',items:[]},
                }
            }
        },
        created() {
            this.util.initTable(this);
            this.util.initDict(this);
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
