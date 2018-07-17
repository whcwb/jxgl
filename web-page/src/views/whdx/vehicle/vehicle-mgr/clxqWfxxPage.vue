<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<Row>
		<Col span="24">
			<Tabs type="card" style="padding-left: 10px">
				<TabPane label="未处理">
					<clxq-wfxx-detail-page :vehcile="vehcile" wflx="01"></clxq-wfxx-detail-page>
				</TabPane>
				<TabPane label="已处理">
					<clxq-wfxx-detail-page :vehcile="vehcile" wflx="02"></clxq-wfxx-detail-page>
				</TabPane>
			</Tabs>
		</Col>
	</Row>
</template>

<script>

    //违法详情
    import clxqWfxxDetailPage from './clxqWfxxDetailPage.vue'
    export default {
        name: 'wfxx',
		props:{
            vehcile:{
                type:Object,
                default:{}
            }
		},
        components:{clxqWfxxDetailPage},
        data() {
            return {
                v:this,
            }
        },
        created() {
            // this.util.initTable(this);
        },
        methods: {
        }
    }
</script>
