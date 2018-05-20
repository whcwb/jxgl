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
			<div style="display: inline-block">
				<label class="searchLabel">最后一次加油时间:</label>
				<DatePicker v-model="dateRange" @on-ok="form.lastFuelTimeInRange = v.util.dateRangeChange(dateRange)" confirm format="yyyy-MM-dd" type="daterange" placeholder="请输时间" style="width: 200px"></DatePicker>
			</div>
			<Button type="primary" @click="v.util.getPageData(v)">
				<Icon type="search"></Icon>
			</Button>
			<!--<Button type="primary" @click="v.util.add(v)">-->
				<!--<Icon type="plus-round"></Icon>-->
			<!--</Button>-->
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
        name: 'vehicleTable',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
				pagerUrl:this.apis.oilRecord.list,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '最后一次加油时间',key:'lastFuelTime'},
                    {title: '最后一次加油金额',key:'lastFuelMoney',unit:'元'},
                    {title: '最后一次加油容量',key:'lastFuelCapacity',unit:'L'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildButton(this,h,'success','plus','加油',()=>{
									this.choosedItem = params.row;
									this.componentName = 'formData';
								}),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    lastFuelTimeInRange:'',
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
