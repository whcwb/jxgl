<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Row>
			<span style="font-size: 14px;">保养记录</span>
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
                apiRoot:this.apis.maintainInfo,
                tableHeight: 300,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 70, type: 'index'},
                    {title: '车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '最后一次保养时间',key:'byBysj',searchKey:'byBysjInRange',searchType:'daterange'},
                ],
                pageData: [],
                form: {
                    byBysjInRange:'',
                    orderBy:'byBysj desc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 10,
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
            showMore(type){
                this.$router.push({name:'vehbaoxian-baoyang'})
            }
        }
    }
</script>
