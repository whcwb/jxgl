<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Form :label-width="100">
            <Row justify="space-between">
                <Col span="4">
                    <FormItem label="车牌号">
                        <Input v-model="form.vHphmLike" placeholder="请输入车牌号"></Input>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="车辆类型">
                        <Select filterable clearable v-model="form.vHpzl" placeholder="请选择车辆类型...">
                            <Option v-for='(item,index) in dicts.hpzl.items' :value="item.key">{{item.val}}</Option>
                        </Select>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="车辆状态">
                        <Select filterable clearable v-model="form.vZtLike" placeholder="请选择车辆状态...">
                            <Option v-for='(item,index) in dicts.clzt.items' :value="item.key">{{item.val}}</Option>
                        </Select>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="所有人">
                        <!--<Input v-model="form.vSylLike" placeholder="请输入所有人"></Input>-->
                        <Select filterable clearable v-model="form.vSylLike" placeholder="请输入所有人">
                            <Option v-for='(item,index) in dicts.clzt.items' :value="item.key">{{item.val}}</Option>
                        </Select>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="责任人">
                        <Input v-model="form.vZrrLike" placeholder="请输入责任人"></Input>
                    </FormItem>
                </Col>
            </Row>
            <Row justify="space-between">
                <Col span="4">
                    <FormItem label="年审日期">
                        <DatePicker :value="form.vNsrqLike" type="month" placement="top-start" placeholder="请选择日期"
                                    @on-change="(date)=>{form.vNsrqLike = date}"></DatePicker>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="运营证">
                        <Select clearable v-model="form.yyzFlag" placeholder="请选择...">
                            <Option value="0">未上传</Option>
                            <Option value="1">已上传</Option>
                        </Select>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="卡机">
                        <Select clearable v-model="form.vAzkj" placeholder="请选择...">
                            <Option value="0">未安装</Option>
                            <Option value="1">已安装</Option>
                        </Select>
                    </FormItem>
                </Col>
                <Col span="4">
                    <FormItem label="选项">
                        <Select clearable v-model="param" placeholder="请选择..."
                                @on-change="v=>{param=(v==undefined?-1:param)}">
                            <Option v-for="item in listType" :value="item.value" :key="item.value">{{ item.label }}</Option>
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
                    <Button type="primary" @click="v.util.export(v)">
                        导出
                    </Button>
                </Col>
            </Row>
            <Row style="position: relative;">
                <Table ref="table" :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>
            </Row>
            <Row class="margin-top-10 pageSty">
                <Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator
                      @on-change='pageChange'></Page>
            </Row>
            0f
        </Form>
        <component :is="componentName"></component>

        <!-- 年审单打印 -->
        <div id="printDiv" ref="printDiv" style="position: absolute;left:0;top:0;z-index: -10">
            <ul>
                <li>
                    <img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszzmFile'"
                         :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">
                    <img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszfmFile'"
                         :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">
                </li>
                <li>
                    <img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszzmFile'"
                         :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">
                    <img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszfmFile'"
                         :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">
                </li>
            </ul>
        </div>
    </div>
</template>

<script>
    import formData from './formData.vue'
    //分配人员
    import allocPerson from './allocPerson.vue'
    //证件查看
    import showPhoto from './addlistfileImg.vue'
    //车辆年审
    import clnsForm from './clnsForm.vue'
    //车辆详情
    import clxqPage from './clxqPage.vue'
    import swal from 'sweetalert2'
    import Print from 'print-js'

    export default {
        name: 'vehicleTable',
        components: {formData, allocPerson, showPhoto, clnsForm, clxqPage},
        data() {
            return {
                v: this,
                SpinShow: true,
                apiRoot: this.apis.CAR,
                listType: [{                                      //选项
                    value: 0,
                    label: '临期年审'
                },
                    {
                        value: 1,
                        label: '逾期年审'
                    },
                    {
                        value: 2,
                        label: '强制报废'
                    }
                ],
                param: -1,                       //选项需要传递的url参数
                paramArr: {0: '?lqnj=lqnj', 1: '?lqnj=yqns', 2: '?lqnj=qzbf'},
                tableHeight: 160,
                componentName: '',
                choosedItem: null,
                exportParam: {
                    start: false,
                    filename: '车辆统计'
                },
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '车牌号', width: 120, key: 'vHphm', searchKey: 'vHphm', sortable: true},
                    {title: '驾校名称', width: 120, key: 'vHphm', searchKey: 'vHphm'},
                    {
                        title: '车辆类型', width: 120, key: 'vHpzl', render: (h, params) => {
                            let val = $.map(this.dicts.hpzl.items, item => {
                                if (item.key == params.row.vHpzl) {
                                    return item.val;
                                }
                            });
                            return val;
                        }
                    },
                    {
                        title: '状态', width: 120, key: 'vZt', render: (h, params) => {
                            let zts = params.row.vZt.split('');
                            let ztss = '';
                            for (let r of zts) {
                                let val = $.map(this.dicts.clzt.items, item => {
                                    if (item.key === r) {
                                        ztss += item.val + ',';
                                    }
                                });
                            }
                            if (ztss.charAt(ztss.length - 1) === ',') {
                                ztss = ztss.substring(0, ztss.length - 1);
                            }
                            return h('div', ztss);
                        }
                    },
                    {title: '初登日期', width: 120, key: 'vCcdjrq', sortable: true},
                    {
                        title: '年审日期', width: 180, key: 'vNsrq', render: (h, params) => {
                            let today = new Date().format("yyyy-MM-dd");
                            let f = today >= params.row.vNsrq;
                            let content = "请尽快完成年审";
                            let color = "red";
                            if (!f) {
                                color = "green";
                                content = "暂不需要年审";
                            }

                            return h('Tooltip', {
                                props: {
                                    trigger: 'hover',
                                    content: content,
                                    placement: 'bottom'
                                }
                            }, [
                                h('Tag', {
                                    props: {
                                        type: 'dot',
                                        color: color
                                    }
                                }, params.row.vNsrq)
                            ]);
                        },
                        filters: [
                            {
                                label: '超期未年审',
                                value: 1
                            }
                        ],
                        filterMultiple: false,
                        filterMethod(value, row) {
                            let today = new Date().format("yyyy-MM-dd");
                            let f = today >= row.vNsrq;
                            if (!f) {
                                return false;
                            }

                            return true;
                        }
                    },
                    {
                        title: '运营证', width: 120, key: 'yyzFlag', render: (h, params) => {
                            let flag = params.row.yyzFlag;
                            if (flag) {
                                return h('Tag', {
                                    props: {
                                        type: 'dot',
                                        color: 'green'
                                    }
                                }, '已传');
                            }

                            return h('Tag', {
                                props: {
                                    type: 'dot'
                                }
                            }, '未传');
                        }
                    },
                    {title: '责任人', width: 120, key: 'vZrr'},
                    {title: '责任人电话', width: 120, key: 'vZrrlxdh'},
                    {title: '所有人', key: 'vSyl'},
                    {
                        title: '使用人', key: 'vLxr', render: (h, params) => {
                            let lxr = params.row.vLxr;

                            if (lxr) {
                                lxr = lxr.split("-")[1];
                            } else {
                                lxr = '-';
                            }
                            return h('div', lxr);
                        }
                    },
                    {
                        title: '操作',
                        key: 'action',
                        fixed: 'right',
                        width: 280,
                        align: 'center',
                        render: (h, params) => {
                            return h('div', [
                                this.util.buildEditButton(this, h, params),
                                this.util.buildButton(this, h, 'info', 'ios-list-outline', '车辆详情', () => {
                                    this.showClxqPage(params)
                                }),
                                // this.util.buildButton(this, h, 'info', 'calendar', '车辆年审', ()=>{this.showNsPage(params)}),
                                this.util.buildButton(this, h, 'info', 'person', '车辆分配', () => {
                                    this.toPerson(params)
                                }),
                                this.util.buildButton(this, h, 'info', 'ios-eye', '证件照片', () => {
                                    this.showImgFile(params)
                                }),
                                // this.util.buildButton(this, h, 'info', 'printer', '年审打印', ()=>{this.showNsdyPage(params)}),
                                // this.util.buildButton(this, h, 'info', 'email', '年审通知', ()=>{this.showDxtzPage(params)}),

                                this.util.buildDeleteButton(this, h, params.row.vId),
                            ]);
                        }
                    }
                ],
                pageData: [],
                form: {
                    vHphmLike: '',
                    vHpzl: '',
                    total: 0,
                    pageNum: 1,
                    pageSize: 8,
                },
                dicts: {
                    hpzl: {code: 'HPZL', items: []},
                    syxz: {code: 'SYXZ', items: []},
                    clzt: {code: 'clzt', items: []}
                },
                jszPrintImgs: [],
                xszPrintImgs: []
            }
        },
        created() {
            //如果是点击首页更多车辆进来的，就重新获取数据
            this.param = this.$store.state.app.moreCarType == -1 ? -1 : this.$store.state.app.moreCarType
            this.util.initTable(this);
            this.util.initDict(this);
            this.tableHeight = window.innerHeight - 290;
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            },
            //车辆分配
            toPerson(param) {
                this.choosedItem = param.row;
                this.componentName = 'allocPerson';
            },
            //证件照片
            showImgFile(param) {
                this.choosedItem = param.row;
                this.componentName = 'showPhoto';
            },
            //车辆年审界面
            showNsPage(param) {
                this.choosedItem = param.row;
                this.componentName = 'clnsForm';
            },
            //车辆详情
            showClxqPage(param) {
                this.choosedItem = param.row;
                this.componentName = 'clxqPage';
            },
            //年审打印
            showNsdyPage(param) {
                let v = this;
                swal.showLoading();
                v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vId).then((res) => {
                    if (res.code === 200 && res.result != null && res.result.length > 0) {
                        this.xszPrintImgs = res.result;

                        v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vLxr.split('-')[0]).then((res) => {
                            swal.close();

                            this.jszPrintImgs = res.result;
                            Print({
                                printable: 'printDiv',
                                type: 'html',
                                onLoadingStart: () => {
                                    this.$refs.printDiv.style = "display:block";
                                },
                                onLoadingEnd: () => {
                                    this.$refs.printDiv.style = "display:none";
                                }
                            });
                        }, (error) => {
                            swal({
                                text: '网络异常',
                                type: 'error'
                            })
                        });
                    } else {
                        swal({
                            text: "请先上传证件！",
                            type: "error"
                        })
                    }
                }, (error) => {
                    swal({
                        text: '网络异常',
                        type: 'error'
                    })
                })
            },
            //年审通知
            showDxtzPage(param) {
                let v = this;
                swal.queue([{
                    text: "确认发送年审通知短信?",
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonText: '确认',
                    cancelButtonText: '取消',
                    showLoaderOnConfirm: true,
                    preConfirm: function () {
                        return new Promise(function (resolve) {
                            v.$http.get(v.apis.CAR.SENDSMS + param.row.vId).then((res) => {
                                let type = "success";
                                if (res.code !== 200) {
                                    type = "error";
                                }
                                swal.insertQueueStep({
                                    text: res.message,
                                    type: type
                                })

                                resolve();
                            }, (error) => {
                                swal.insertQueueStep({
                                    text: '网络异常',
                                    type: 'error'
                                })
                                resolve();
                            })
                        })
                    }
                }]);
            }
        },
        beforeDestroy(){
            this.$store.commit('moreCarTypeChange',-1)          //离开页面之前将选项重置
        }
    }
</script>
