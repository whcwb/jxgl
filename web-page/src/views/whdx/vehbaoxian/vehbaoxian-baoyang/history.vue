<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false' :mask-closable="false"  title="历史记录">
			<div style="overflow: auto;height: 500px;">
				<Row style="padding-bottom: 16px;">
					<div v-for="r in tableColumns" v-if="r.searchKey" style="display: inline-block">
						<label class="searchLabel">{{r.title}}:</label>
						<Input v-model="form[r.searchKey]" :placeholder="'请输入'+r.title" style="width: 200px"></Input>
					</div>
					<div style="display: inline-block">
						<DatePicker v-model="dateRange" @on-ok="form.createTimeInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
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
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
				<Button type="primary" @click="v.util.save(v)">确定</Button>
			</div>
		</Modal>
	</div>
</template>

<script>
    export default {
        name: 'yljlTable',
        data() {
            return {
                v:this,
                SpinShow: true,
                showModal:true,
                apiRoot:this.apis.maintain,
                tableHeight: 320,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '保养金额',key:'bydByje',unit:'元'},
                    {title: '保养时间',key:'createTime'},
                ],
                pageData: [],
                form: {
                    createTimeInRange:'',
                    vId:0,
                    total: 0,
                    pageNum: 1,
                    pageSize: 5,
                },
            }
        },
        created() {
            this.form.vId = this.$parent.choosedItem.vId;
            this.util.initModalTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
