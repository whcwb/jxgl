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
				height: 220px;
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
					<infor-card id-name="user_created_count" :end-val="count.total" iconType="model-s" color="#2d8cf0" intro-text="车辆总数"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="visit_count" :end-val="count.lqby"  iconType="ios-color-wand" color="#64d572" :iconSize="50" intro-text="临期保养"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="collection_count" :end-val="count.stop" iconType="checkmark" color="#ffd572" intro-text="临期年检"></infor-card>
				</Col>
				<Col :xs="24" :sm="12" :md="6" :style="{marginBottom: '10px'}">
					<infor-card id-name="transfer_count" :end-val="count.offline" iconType="briefcase" color="#f25e43" intro-text="保单到期"></infor-card>
				</Col>
			</Row>
			<Row :gutter="12" class="margin-bottom-15">
				<Col span="8">
					<!--保养提醒 -->
					<div class="divpadd">
						<div class="divbgcolor">
							<maintain-simple-table ></maintain-simple-table>
						</div>
					</div>
				</Col>
				<Col span="8">
					<!--临期年检-->
					<div class="divpadd">
						<div class="divbgcolor">
							<nianshen-table></nianshen-table>
						</div>
					</div>
				</Col>
				<Col span="8">
					<!--逾期年审提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<yqns-table></yqns-table>
						</div>
					</div>
				</Col>
			</Row>
			<Row :gutter="12" class="margin-bottom-15">
				<Col span="8">
					<!--交强险提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<jqx-table></jqx-table>
						</div>
					</div>
				</Col>
				<Col span="8">
					<!--商业险提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<syx-table></syx-table>
						</div>
					</div>
				</Col>
				<Col span="8">
					<!--强制报废提醒 -->
					<div class="divpadd">
						<div class="divbgcolor">
							<qzbf-table></qzbf-table>
						</div>
					</div>
				</Col>
			</Row>
			<Row :gutter="12" class="margin-bottom-15">
				<Col span="12">
					<!--交强险提醒-->
					<div class="divpadd">
						<div class="divbgcolor">
							<jqx-gb-table></jqx-gb-table>
						</div>
					</div>
				</Col>
				<Col span="12">
					<!--商业险已过保-->
					<div class="divpadd">
						<div class="divbgcolor">
							<syx-gb-table></syx-gb-table>
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
	import nianshenTable from '../../views/whdx/vehicle/vehicle-mgr/lqnjimpleTable'
	import qzbfTable from '../../views/whdx/vehicle/vehicle-mgr/qzbf'
	import syxTable from '../../views/whdx/vehicle/vehicle-baoxian/syxSimpleTable'
	import jqxTable from '../../views/whdx/vehicle/vehicle-baoxian/jqxSimpleTable'
	import jqxGbTable from '../../views/whdx/vehicle/vehicle-baoxian/jqxGbSimpleTable'
	import syxGbTable from '../../views/whdx/vehicle/vehicle-baoxian/syxGbSimpleTable'
	import ljbf from '../../views/whdx/vehicle/vehicle-baoxian/ljbfSimpleTable'
	import yqnsTable from '../../views/whdx/vehicle/vehicle-mgr/yqnsSimpleTable'

	export default {
		name: 'home',
		components: {
			inforCard,eLine,yPie,
			safeline,listpie,extra,scbar,risk,csMessbar,maintainSimpleTable,nianshenTable,qzbfTable,syxTable,jqxTable,
            jqxGbTable,syxGbTable,ljbf,yqnsTable
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
				    console.log(res)
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
