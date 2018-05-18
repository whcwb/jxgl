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

    export default {
        name: 'wfxxTable',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.wfxx,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '违法编号',key:'wfId'},
                    {title: '违法时间',key:'wfWfsj'},
                    {title: '违法地点',key:'wfWfdz'},
                    {title: '违法行为',key:'wfWfxw'},
                    {title: '车辆ID',key:'vId'},
                    {title: '车牌号码',key:'vHphm'},
                    {title: '违法记分',key:'wfWfjf'},
                    {title: '违法金额',key:'wfWfje'},
                    {title: '违法状态',key:'wfWfzt'},
                    {title: '创建人',key:'createUser'},
                    {title: '创建时间',key:'createTime'},
                    {title: '修改人',key:'updateUser'},
                    {title: '修改时间',key:'updateTime'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildDeleteButton(this,h,params.row.id),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
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
