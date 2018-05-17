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
							<span>油卡管理</span>
						</div>
						<div class="body-r-1 inputSty">
							<Input v-model="form.gnmcLike" placeholder="请输入油卡名称" style="width: 200px"></Input>
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
				:is="componentName"
				:Dictionary="Dictionary"></component>
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
                apiRoot:this.apis.OIL_CARD,
                tabHeight: 220,
                componentName: '',
                choosedItem: null,
                //数据传输
                chmess: {},
                tableTiT: [
                    {title: "序号", width: 60, align: 'center', type: 'index'},
                    {title: '油卡卡号', align: 'center', key: 'ykId'},
                    {title: '发卡公司', align: 'center', key: 'ykFkgs'},
                    {title: '卡余额', align: 'center', key: 'ykYe'},
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
                Dictionary: [],
                lmdmDictionary: 'ZDCLK0007'
            }
        },
        created() {
            this.$store.commit('setCurrentPath', [{title: '首页',}, {title: '系统管理',}, {title: '油卡管理',}])
            this.util.initTable(this)
            this.getLXDic()//字典数据
        },
        methods: {
            getLXDic() {
                this.Dictionary = this.dictUtil.getByCode(this, this.lmdmDictionary);
            },
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
