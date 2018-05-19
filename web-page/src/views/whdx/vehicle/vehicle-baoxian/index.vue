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
        name: 'insuranceTable',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.insurance,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '保单编号',key:'inBdh'},
                    {title: '车辆ID',key:'vId'},
                    {title: '车牌号码',key:'vHphm',searchKey:'vHphmLike'},
                    {title: '商业险保险公司',key:'inBxgs'},
                    {title: '商业险保险电话',key:'inBxdh'},
                    {title: '商业险起保时间',key:'inQbrq'},
                    {title: '商业险终保时间。根据起保时间自动推算一年',key:'inZbrq'},
                    {title: '商业险保险金额',key:'inBxje'},
                    {title: '商业险险种。多个险种使用,分隔',key:'inXz'},
                    {title: '交强险保单号',key:'inJqbdh'},
                    {title: '交强险保险公司',key:'inJqbxgs'},
                    {title: '交强险保险电话',key:'inJqbxdh'},
                    {title: '交强险起保时间',key:'inJqqbrq'},
                    {title: '交强险终保时间。根据起保时间自动推算一年',key:'inJqzbrq'},
                    {title: '交强险保险金额',key:'inJqbxje'},
                    {
                        title: '操作',
                        key: 'action',
                        width: 120,
                        fixed: 'right',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this,h,params),
                                this.util.buildDeleteButton(this,h,params.row.inId),
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
