<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<div v-for="r in tableColumns" v-if="r.searchKey" style="display: inline-block">
				<label class="searchLabel">{{r.title}}:</label>
				<Input v-if="!r.searchType" v-model="form[r.searchKey]" :placeholder="'请输入'+r.title" style="width: 200px"></Input>
			</div>
			<div style="display: inline-block">
				<DatePicker v-model="dateRange" @on-ok="form.ylCzsjInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
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

    import mixins from '@/mixins'
    export default {
        name: 'yljlTable',
        mixins:[mixins],
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
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号',key:'vHphm'},
                    {title: '油料类型',key:'ylYllx',dict:'yllx'},
                    {title: '油料容量',key:'ylYlrs',unit:'L'},
                    {title: '金额',key:'ylJe',unit:'元'},
                    {title: '操作时间',key:'createTime'},
                ],
				dateRange:'',
                pageData: [],
                form: {
                    ykId:0,
                    ylCzlx:'20',
                    total: 0,
                    pageNum: 1,
                    pageSize: 5,
                    ylCzsjInRange:''
                },
            }
        },
        created() {
            this.form.ykId = this.$parent.ykId;
            this.util.initModalTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
