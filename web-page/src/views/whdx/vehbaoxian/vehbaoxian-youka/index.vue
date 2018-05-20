<style lang="less">
	@import '../../../../styles/common.less';
</style>
<!--角色管理-->
<template>
	<div class="boxbackborder">
		<Row style="padding-bottom: 16px;">
			<div v-for="r in tableColumns" v-if="r.searchKey" style="display: inline-block">
				<label class="searchLabel">{{r.title}}:</label>
				<Input v-model="form[r.searchKey]" :placeholder="'请输入'+r.title" style="width: 200px"></Input>
			</div>
			<div style="display: inline-block">
				<label class="searchLabel">最后一次用卡时间:</label>
				<DatePicker v-model="dateRange" @on-ok="form.ykZsyksjInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
			</div>
			<Button type="primary" @click="v.util.getPageData(v)">
				<Icon type="search"></Icon>
			</Button>
			<Button type="primary" @click="v.util.add(v)">
				<Icon type="plus-round"></Icon>
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
    import charge from './charge.vue'
    import record from './record.vue'

    export default {
        name: 'oilCard',
        components: {formData,charge,record},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.OIL_CARD,
                tableHeight: 220,
                componentName: '',
                dateRange:'',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 70,  type: 'index'},
                    {title: '油卡卡号',key: 'ykId',searchKey:'ykIdLike'},
                    {title: '发卡公司',key: 'ykFkgs'},
                    {title: '卡余额',  key: 'ykYe',unit:'元'},
                    {title: '最后一次用卡时间',  key: 'ykZsyksj'},
                    {title: '最后一次用卡车辆牌号',  key: 'ykZshphm',searchKey:'ykZshphmLike'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 150,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this,h,'success','compose','历史记录',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'record'
								}),
                                this.util.buildButton(this,h,'info','social-yen','充值',()=>{
                                    this.choosedItem = params.row;
                                    this.componentName = 'charge'
								}),
                                this.util.buildDeleteButton(this,h,params.row.gndm),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    ykZsyksjInRange:'',
                    ykZshphmLike:'',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
            }
        },
        created() {
            this.util.initTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
