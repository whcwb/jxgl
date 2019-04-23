<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row>
			<span style="font-size: 14px;">临期年审</span>
			<span style="float: right;color: deepskyblue;cursor: pointer" @click="showMore()">查看更多</span>
		</Row>
		<Row style="position: relative;">
			<Table :height="170" :columns="tableColumns" :data="pageData"></Table>
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
				pagerUrl:this.apis.CAR.QUERY+'?lqnj=lqnj',
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
                console.log("yunxingle")
                this.$store.commit('moreCarTypeChange',0);
                this.$router.push({name:'vehicle-mgr'})
            }
        }
    }
</script>
