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
                <Table :height="tableHeight" :row-class-name="rowClassName" :columns="tableColumns" :data="pageData"></Table>
            </Row>
            <Row class="margin-top-10 pageSty">
                <Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
                      @on-change='pageChange'></Page>
            </Row>
        <component
                :is="componentName"
                :Dictionary="Dictionary"></component>
    </div>
</template>

<script>
    import mixins from '@/mixins'
    import formData from './comp/formData.vue'

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
                apiRoot:this.apis.FUNCTION,
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                //数据传输
                chmess: {},
                tableColumns: [
                    {title: "序号", width: 60, align: 'center', type: 'index', fixed: 'left'},
                    {title: '功能名称', align: 'center', width: 120, key: 'gnmc', fixed: 'left',searchKey:'gnmcLike'},
                    {title: '功能代码', align: 'center', width: 120, key: 'gndm'},
                    {title: '服务代码', align: 'center', width: 120, key: 'fwdm'},
                    {
                        title: '状态', align: 'center', width: 120, key: 'zt',
                        render: (h, p) => {
                            let val = this.dictUtil.getValByCode(this, this.dicts.zt.code, p.row.zt)
                            return h('div', val)
                        }

                    },
                    {title: '排序', align: 'center', width: 120, key: 'px'},
                    {title: '备注', align: 'center', width: 120, key: 'bz'},
                    {title: 'URL', align: 'center', width: 120, key: 'url'},
                    {title: '父节点', align: 'center', width: 120, key: 'fjd'},
                    {title: '跳转地址', align: 'center', width: 120, key: 'tzdz'},
                    {
                        title: '图标',
                        align: 'center',
                        width: 60,
                        key: 'tb',
                        render: (h, params) => {
                            return h('div', [
                                h('Icon', {
                                    props: {
                                        type: params.row.tb,
                                        size: '22'
                                    },
                                    on: {
                                        click: () => {
                                            //log('数据调试', params)
                                        }
                                    }
                                })
                            ]);
                        }
                    },
                    {
                        title: 'API前缀',
                        align: 'center',
                        width: 120,
                        key: 'apiQz'
                    },
                    {
                        title: 'API后缀',
                        align: 'center',
                        width: 120,
                        key: 'apiHz'
                    },
                    // {
                    //     title: '创建人',
                    //     width: 100,
                    //     align: 'center',
                    //     key: 'cjr'
                    // },
                    // {
                    //     title: '创建时间',
                    //     width: 100,
                    //     align: 'center',
                    //     key: 'cjsj'
                    // },
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
                lmdmDictionary: 'ZDCLK0007',
                dicts:{
                    zt:{code:'ZDCLK0007',items:[]}
                }
            }
        },
        created() {
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
