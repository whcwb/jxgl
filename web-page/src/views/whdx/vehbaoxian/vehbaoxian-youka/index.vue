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

    export default {
        name: 'oilCard',
        components: {formData,charge},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.OIL_CARD,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60,  type: 'index'},
                    {title: '油卡卡号',key: 'ykId',searchKey:'ykIdLike'},
                    {title: '发卡公司',key: 'ykFkgs'},
                    {title: '卡余额',  ey: 'ykYe'},
                    {title: '最后一次用卡时间',  key: 'ykZsyksj',},
                    {title: '最后一次用卡车辆牌号',  key: 'ykZshphm',},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildButton(this,h,'success','plus',()=>{
                                    this.componentName = 'charge'
                                    this.choosedItem = params.row;
								}),
                                this.util.buildDeleteButton(this,h,params.row.gndm),
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
