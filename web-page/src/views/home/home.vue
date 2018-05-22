<style lang="less">
	@import "../../styles/common.less";
	.homeE{
		.indexCarType{
			border-bottom: solid 1px #C0C0C0;
			box-shadow: 2px 5px 5px #888888;
		}
		.divpadd{
			box-shadow: 2px 5px 5px #888888;
    		border: solid 2px #ded9d9;
			.divbgcolor{
				height: 360px;
				/*background: rgba(0,0,0,0.5);*/
				background-color: #fff;
			}
		}
	}
</style>
<template>
	<div class="box" style="height: 100%;background:#fff">
		<component :is="componentName"></component>
		<div  class="homeE" style="padding: 5px 3px;">
			<Row :gutter="8" class="margin-bottom-10 indexCarType">
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="user_created_count" :end-val="count.total" iconSrc="/static/icon/device.png" color="#2d8cf0" intro-text="车辆总数"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="visit_count" :end-val="count.lqby"  iconSrc="/static/icon/device_online.png" color="#64d572" :iconSize="50" intro-text="临期保养"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="collection_count" :end-val="count.stop" iconSrc="/static/icon/device_stop.png" color="#ffd572" intro-text="临期年检"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="transfer_count" :end-val="count.offline" iconSrc="/static/icon/device_offline.png" color="#f25e43" intro-text="保单到期"></infor-card>
				</Col>
			</Row>
			<Row :gutter="12" class="margin-bottom-15">
				<Col span="12">
					<div class="divpadd">
						<div class="divbgcolor">
							<maintain-simple-table ></maintain-simple-table>
						</div>
					</div>
				</Col>
				<Col span="12">
					<!--年审提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<nianshen-table></nianshen-table>
						</div>
					</div>
				</Col>
			</Row>
			<Row :gutter="12" class="margin-bottom-15">
				<Col span="12">
					<div class="divpadd">
						<div class="divbgcolor">
							<qzbf-table></qzbf-table>
						</div>
					</div>
				</Col>
				<Col span="12">
					<!--年审提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<y-pie Eid="ybar"></y-pie>
						</div>
					</div>
				</Col>
			</Row>
		</div>
	</div>
</template>

<script>
	import inforCard from './components/inforCard.vue'
	import eLine from './compEcharts/line.vue'
	import yPie from './compEcharts/yearPie.vue'
	import safeline from './compEcharts/safeline.vue'
	import listpie from './compEcharts/listPie.vue'
	import extra from './compEcharts/extrabar.vue'
	import scbar from './compEcharts/scbar.vue'
	import risk from './compEcharts/riskRecord.vue'

	import maintainSimpleTable from '../../views/whdx/vehbaoxian/vehbaoxian-baoyang/simpleTable'
	import csMessbar from './compEcharts/comp/csMessbar'
	import nianshenTable from '../../views/whdx/vehicle/vehicle-baoxian/simpleTable'
	import qzbfTable from '../../views/whdx/vehicle/vehicle-baoxian/qzbf'
	export default {
		name: 'home',
		components: {
			inforCard,eLine,yPie,
			safeline,listpie,extra,scbar,risk,csMessbar,maintainSimpleTable,nianshenTable,qzbfTable
		},
		data() {
			return {
                userType:'',
                showChart:false,
                componentName:'',
				count: {
                    lqby:0,
                    total: 0,
                    online: 0,
                    stop: 0,
                    offline: 0
				},
			};
		},
        computed:{
            title(){
                return this.$store.state.app.title;
            },
            echData(){
                return this.$store.state.app.ech
            }
        },
		watch:{
			echData:function (n,o) {
				this.componentName = 'csMessbar'
			}
		},
		created() {
		    this.getShouldMaintainList();
		    this.getTotalCarCount();
		    this.getQZBFList();
		},
		methods: {
		    getTotalCarCount(){
				this.$http.get(this.apis.CAR.countByCondition).then((res)=>{
				    if (res.code === 200 && res.result){
                        this.count.total = res.result;
					}
				})
			},
		    getShouldMaintainList(){
		        this.$http.get("/api/maintainInfo/getShouldMaintainList").then((res)=>{
		            if (res.code === 200 && res.result){
		                this.count.lqby = res.result.length;
					}
                })
			},
		    getQZBFList(){
		        this.$http.get("/api/car/lqnjCarList").then((res)=>{
		            if (res.code === 200 && res.result){
		                this.count.lqby = res.result.length;
					}
                })
			},
		}
	};
</script>
