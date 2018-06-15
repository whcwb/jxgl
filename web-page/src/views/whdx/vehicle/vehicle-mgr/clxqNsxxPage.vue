<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row type="flex" justify="end">
				<Col offset="1">
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

    export default {
        name: 'clns',
        props:{
            vehcile:{
                type:Object,
                default:{}
            }
        },
        data() {
            return {
                v:this,
                SpinShow: true,
                pagerUrl:this.apis.CAR.CLNSPAGER,
                tableHeight: 220,
                componentName: '',
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'操作时间',key:'createTime', width:140},
                    {title:'年审时间',key:'vlXqsj', width:140},
                    {title:'年审内容',key:'vlText'},

                ],
                pageData: [],
                form: {
                    vId:'',
                    vlXqlx:'10',
                    orderBy:'createTime desc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                }
            }
        },
        created() {
            console.log(this.vehcile);
            this.form.vId = this.vehcile.vId;
            this.util.initTable(this);
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
