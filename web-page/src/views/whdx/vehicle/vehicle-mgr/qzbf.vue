<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row>
			<span style="font-size: 14px;">强制报废</span>
			<span style="float: right;color: deepskyblue;cursor: pointer" @click="showMore()">查看更多</span>
		</Row>
		<Row style="position: relative;">
			<Table :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
		</Row>
		<component :is="componentName"></component>
	</div>
</template>

<script>

    export default {
        name: 'byxxTable',
        data() {
            return {
                v:this,
                SpinShow: true,
				pagerUrl:this.apis.CAR.QUERY+'?lqnj=qzbf',
                tableHeight: 300,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号码',key:'vHphm'},
                    {title: '年审时间',key:'vNsrq'},
                ],
                pageData: [],
                form: {
                    byBysjInRange:'',
                    orderBy:'vNsrq desc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 5,
                },
            }
        },
        created() {
            this.util.initSimpleTable(this)
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
            showMore(){
                this.$store.commit('moreCarTypeChange',2);
                this.$router.push({name:'vehicle-mgr'})
            }
        }
    }
</script>
