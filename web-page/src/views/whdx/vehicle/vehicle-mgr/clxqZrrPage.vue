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
                pagerUrl:this.apis.CAR.CHGPAGER,
                tableHeight: 220,
                componentName: '',
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'操作时间',key:'createTime', width:140},
                    {title:'变更前责任人',key:'chgOzrr', width:140},
                    {title:'变更前联系电话',key:'chgOzrrlxdh'},
                    {title:'变更后责任人',key:'chgNzrr', width:140},
                    {title:'变更后联系电话',key:'chgNzrrlxdh'},

                ],
                pageData: [],
                form: {
                    vId:'',
                    orderBy:'createTime desc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                }
            }
        },
        created() {
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
