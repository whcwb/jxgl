<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row style="position: relative;" :gutter="20">
				<Col span="24">
					<Card>
						<div style="display: inline-block;margin-bottom: 6px;">
							<label>维修时间:</label>
							<DatePicker v-model="dateRange" @on-change="form.repairTimeInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
							<label>使用人:</label>
							<Input v-model="form.syrLike" style="width: 200px"></Input>
							<label>基地:</label>
							<Input v-model="form.jdLike" style="width: 200px"></Input>
							<Button type="primary" @click="queryReport">
								<Icon type="search"></Icon>
							</Button>
							<Button type="primary" icon="ios-download" @click="exportData()">
								<span>导出数据</span>
							</Button>
						</div>

						<Table ref="table" :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
					</Card>
				</Col>
			</Row>
		</Form>
	</div>
</template>

<script>
    export default {
        name: 'reportZrrTable',
        data() {
            return {
                v:this,
                SpinShow: true,
                dateRange:'',
                pagerUrl:this.apis.report.wx,
                tableHeight: 560,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '基地',key:'jd'},
                    {title: '使用人',key:'syr'},
                    {title: '车辆数',key:'c'},
                    {title: '维修总金额',key:'s'},
                ],
                pageData: [],
                form: {
                    repairTimeInRange:'',
                    syrLike:'',
                    jdLike:'',
                },
            }
        },
		mounted(){
            this.queryReport();
		},
        methods: {
            queryReport(){
                this.$http.post(this.pagerUrl, this.form).then((response) => {
                        let code = response.code;
                        let msg = response.message;
                        this.SpinShow = false
                        if (code === 200) {
                            this.pageData = response.result;
                        }else{
                            this.$Message.error(msg);
						}
                    }, (error) => {
                    	this.$Message.error("网络异常");
                    }
                ).then((next) => {
                });
			},
            exportData () {
				this.$refs.table.exportCsv({
					filename: '维修统计表'
				});
            }
        }
    }
</script>
