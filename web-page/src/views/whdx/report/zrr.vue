<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row style="position: relative;" :gutter="20">
				<Col span="24">
					<Card>
						<div>
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
                pagerUrl:this.apis.report.zrr,
                tableHeight: 560,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '责任人',key:'zrr'},
                    {title: '车辆数',key:'num'},
                    {title: '车牌号',key:'num'}				//新增
                ],
                pageData: [],
                form: {
                    vHphmLike:'',
					vHpzl:'',
                },
            }
        },
		mounted(){
            this.queryReport();
		},
        methods: {
            queryReport(){
                this.$http.post(this.apis.report.zrr, this.form).then((response) => {
                        let code = response.code;
                        let msg = response.message;
                        this.SpinShow = false
                        if (code === 200) {
                            this.pageData = response.result;
                            console.log(this.pageData)
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
					filename: '责任人统计表'
				});
            }
        }
    }
</script>
