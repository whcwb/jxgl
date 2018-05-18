<style lang="less">
	@import '../../../../styles/common.less';
</style>
<!--角色管理-->
<template>
	<div class="boxbackborder">
		<Card>
			<Row class="margin-top-10" style='background-color: #fff;position: relative;'>
				<span class="tabPageTit">
    				<Icon type="ios-paper" size='30' color='#fff'></Icon>
    			</span>
				<div style="height: 45px;line-height: 45px;">
					<div class="margin-top-10 box-row">
						<div class="titmess">
							<span>管理</span>
						</div>
						<div class="body-r-1 inputSty">
							<Input v-model="form.gnmcLike" placeholder="请输入名称" style="width: 200px"></Input>
						</div>
						<div class="butevent">
							<Button type="primary" @click="v.util.getPageData(v)">
								<Icon type="search"></Icon>
							</Button>
							<Button type="primary" @click="v.util.add(v)">
								<Icon type="plus-round"></Icon>
							</Button>
						</div>
					</div>
				</div>
			</Row>
			<Row style="position: relative;">
				<Table :height="tabHeight" :row-class-name="rowClassName" :columns="tableTiT" :data="pageData"></Table>
			</Row>
			<Row class="margin-top-10 pageSty">
				<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
					  @on-change='pageChange'></Page>
			</Row>
		</Card>
		<component
				:is="componentName"></component>
	</div>
</template>

<script>
    import mixins from '@/mixins'
    import formData from './formData.vue'

    export default {
        name: 'char',
        mixins: [mixins],
        components: {
            formData
        },
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.CAR,
                tabHeight: 220,
                componentName: '',
                choosedItem: null,
                //数据传输
                chmess: {},
                tableTiT: [
                    {title: "序号", width: 60, align: 'center', type: 'index'},
                    {title: '主键ID', align: 'center', key: 'vId'},
                    {title: '车牌号', align: 'center', key: 'vHphm'},
                    {title: '车辆类型', align: 'center', key: 'vHpzl'},
                    {title: '车辆品牌', align: 'center', key: 'vClph'},
                    {title: '车辆型号', align: 'center', key: 'vCllx'},
                    {title: '注册登记日期', align: 'center', key: 'vCcdjrq'},
                    {title: '年审时间.通过登记日期自动计算', align: 'center', key: 'vNsrq'},
                    {title: '所有人', align: 'center', key: 'vSyl'},
                    {title: '使用性质', align: 'center', key: 'vSyxz'},
                    {title: '车架号', align: 'center', key: 'vCjh'},
                    {title: '发动机号', align: 'center', key: 'vFdjh'},
                    {title: '状态', align: 'center', key: 'vZt'},
                    {title: '所属公司代码', align: 'center', key: 'vGsdm'},
                    {title: '所属公司名称', align: 'center', key: 'vGsmc'},
                    {title: '使用人', align: 'center', key: 'vLxr'},
                    {title: '使用人联系电话', align: 'center', key: 'vLxdh'},
                    {title: '保单号码', align: 'center', key: 'vBdhm'},
                    {title: '创建人', align: 'center', key: 'createUser'},
                    {title: '创建时间', align: 'center', key: 'createTime'},
                    {title: '修改人', align: 'center', key: 'updateUser'},
                    {title: '修改时间', align: 'center', key: 'updateTime'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 100,
                        align: 'center',
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                h('Button', {
                                    props: {
                                        type: 'success',
                                        icon: 'edit',
                                        shape: 'circle',
                                        size: 'small'
                                    },
                                    style: {
                                        cursor: "pointer",
                                        margin: '0 8px 0 0'
                                    },
                                    on: {
                                        click: () => {
                                            this.componentName = 'formData'
                                            this.choosedItem = params.row;
                                        }
                                    }
                                }),
                                h('Button', {
                                    props: {
                                        type: 'error',
                                        icon: 'close',
                                        shape: 'circle',
                                        size: 'small'
                                    },
                                    style: {
                                        cursor: "pointer",
                                        margin: '0 8px 0 0'
                                    },
                                    on: {
                                        click: () => {
                                            this.util.delete(this,[params.row.gndm])
                                        }
                                    }
                                })
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    gnmcLike: '',
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
