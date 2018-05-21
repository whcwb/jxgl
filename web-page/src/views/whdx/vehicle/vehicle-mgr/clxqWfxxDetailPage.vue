<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="80">
			<Row type="flex" justify="end">
				<Col span="6">
					<FormItem label="违法时间">
						<DatePicker :value="form.tWfsj" @on-change="(date)=>{form.wfWfsjInRange = date[0]+','+date[1]}" type="daterange" confirm placement="bottom-end" placeholder="请选择违法时间" ></DatePicker>
					</FormItem>
				</Col>
				<Col offset="1">
					<Button type="primary" @click="v.util.getPageData(v)">
						<Icon type="search"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
		<Row style="position: relative;">
			<Table height="260" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<Row class="margin-top-10 pageSty">
			<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
				  @on-change='pageChange'></Page>
		</Row>
	</div>
</template>

<script>

    export default {
        name: 'wfxx',
		props:{
            vehcile:{
                type:Object,
                default:{}
            },
            wflx:{
                type:String,
                default:''
            }
		},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.illegal,
                tableHeight: 60,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'违法编号',key:'wfId'},
                    {title:'违法时间',key:'wfWfsj'},
                    {title:'违法地点',key:'wfWfdz'},
                    {title:'违法行为',key:'wfWfxw'},
                    {title:'违法记分',key:'wfWfjf'},
                    {title:'违法金额',key:'wfWfje'},
                ],
                pageData: [],
                form: {
                    vId:'',
                    wfWfzt:'',
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

            this.form.vId = this.vehcile.vId;
            this.form.wfWfzt = this.wflx;
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
