<style lang="less">
	@import '../../../../styles/common.less';
</style>
<template>
	<div class="boxbackborder">
		<Form :label-width="100">
			<Row justify="space-between">
				<Col span="5">
					<FormItem label="车牌号">
						<Input v-model="form.vHphmLike" placeholder="请输入车牌号" ></Input>
					</FormItem>
				</Col>
				<Col span="5">
					<FormItem label="违法时间">
						<DatePicker :value="form.tWfsj" @on-change="(date)=>{form.wfWfsjInRange = date[0]+','+date[1]}" type="daterange" confirm placement="bottom-end" placeholder="请选择违法时间" style="width: 200px"></DatePicker>
					</FormItem>
				</Col>
				<Col span="5">
					<FormItem label="处理状态">
						<Select filterable clearable  v-model="form.wfWfzt" placeholder="'请选择状态">
							<Option v-for = "(item,index) in v.dictUtil.getByCode(v,'WFZT')" :value="item.key">{{item.val}}</Option>
						</Select>
					</FormItem>
				</Col>
				<Col span="4" offset="1">
					<Button type="primary" @click="v.util.getPageData(v)">
						<Icon type="search"></Icon>
					</Button>
					<Button type="primary" @click="v.util.add(v)">
						<Icon type="plus-round"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
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
        name: 'wfxx',
        components: {formData},
        data() {
            return {
                v:this,
                SpinShow: true,
                apiRoot:this.apis.illegal,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title:'车牌号码',key:'vHphm'},
                    {title:'违法编号',key:'wfId'},
                    {title:'违法时间',key:'wfWfsj'},
                    {title:'违法地点',key:'wfWfdz'},
                    {title:'违法行为',key:'wfWfxw'},
                    {title:'违法记分',key:'wfWfjf'},
                    {title:'违法金额',key:'wfWfje'},
                    {title:'违法状态',key:'wfWfzt',render:(h, params)=>{
                        let val = $.map(this.dicts.wfzt.items, item => {
                            if(item.key == params.row.wfWfzt) {
                                return item.val;
                            }
                        });
                        const color = params.row.wfWfzt === '02' ? 'blue' : 'red';
                        return h('Tag', {
                            props: {
                                type: 'dot',
                                color: color
                            }
                        }, val);
                    }},
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
                dicts:{
                    wfzt:{code:'WFZT',items:[]},
                }
            }
        },
        created() {
            this.util.initTable(this);
            this.util.initDict(this);
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
        }
    }
</script>
