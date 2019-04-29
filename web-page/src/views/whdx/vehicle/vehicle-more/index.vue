<!--<style lang="less">-->
    <!--@import '../../../../styles/common.less';-->
<!--</style>-->
<!--<template>-->
    <!--<div class="boxbackborder">-->
        <!--<Form :label-width="100">-->
            <!--<Row  justify="space-between">-->
                <!--<Col span="4">-->
                    <!--<FormItem label="选项">-->
                        <!--&lt;!&ndash;<Input v-model="form.vHphmLike" placeholder="请输入车牌号" ></Input>&ndash;&gt;-->
                        <!--<Select clearable v-model="form.vHphmLike" placeholder="请选择...">-->
                            <!--<Option value="0">临期年审</Option>-->
                            <!--<Option value="1">逾期年审</Option>-->
                            <!--<Option value="2">交强险临期</Option>-->
                            <!--<Option value="3">商业险临期</Option>-->
                            <!--<Option value="4">强制报废</Option>-->
                        <!--</Select>-->
                    <!--</FormItem>-->
                <!--</Col>-->
            <!--</Row>-->
        <!--</Form>-->
        <!--<Row style="position: relative;">-->
            <!--<Table ref="table" :height="tableHeight" :columns="tableColumns" :data="pageData"></Table>-->
        <!--</Row>-->
        <!--<Row class="margin-top-10 pageSty">-->
            <!--<Page :total=form.total :current=form.pageNum :page-size=form.pageSize show-total show-elevator @on-change='pageChange'></Page>-->
        <!--</Row>-->
        <!--<div id="printDiv" ref="printDiv" style="position: absolute;left:0;top:0;z-index: -10">-->
            <!--<ul>-->
                <!--<li>-->
                    <!--<img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="680">-->
                    <!--&lt;!&ndash;<img v-for="img in xszPrintImgs" v-if="img.vfDamc == 'xszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="240">&ndash;&gt;-->
                <!--</li>-->
                <!--<li>-->
                    <!--<img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszzmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="680">-->
                    <!--&lt;!&ndash;<img v-for="img in jszPrintImgs" v-if="img.vfDamc == 'jszfmFile'" :src="apis.STATIC_PATH + img.vfNetPath + '?d='+new Date().getTime()" width="340">&ndash;&gt;-->
                <!--</li>-->
            <!--</ul>-->
        <!--</div>-->
        <!--<component :is="componentName"></component>-->
    <!--</div>-->
<!--</template>-->

<!--<script>-->
    <!--import formData from './formData.vue'-->
    <!--import notifyList from './notifyList'-->
    <!--import swal from 'sweetalert2'-->
    <!--import Print from 'print-js'-->
    <!--export default {-->
        <!--name: 'more',-->
        <!--components: {formData,notifyList},-->
        <!--data() {-->
            <!--return {-->
                <!--v:this,-->
                <!--dateRange:'',-->
                <!--SpinShow: true,-->
                <!--pagerUrl:this.apis.CAR.QUERY+'?lqnj=lqnj',-->
                <!--apiRoot:this.apis.CAR,-->
                <!--today:'',-->
                <!--tableHeight: 220,-->
                <!--componentName: '',-->
                <!--choosedItem: null,-->
                <!--// exportParam:{-->
                <!--//     start:false,-->
                <!--//     filename:'年审统计'-->
                <!--// },-->
                <!--jszPrintImgs:[],-->
                <!--xszPrintImgs:[],-->
                <!--tableColumns: [-->
                    <!--{title: "序号", width: 60, type: 'index'},-->
                    <!--{title: '车牌号', width: 120, key: 'vHphm', searchKey: 'vHphm'},-->
                    <!--{-->
                        <!--title: '车辆类型', width: 120, key: 'vHpzl', render: (h, params) => {-->
                            <!--let val = $.map(this.dicts.hpzl.items, item => {-->
                                <!--if (item.key == params.row.vHpzl) {-->
                                    <!--return item.val;-->
                                <!--}-->
                            <!--});-->
                            <!--return val;-->
                        <!--}-->
                    <!--},-->
                    <!--{-->
                        <!--title: '状态', width: 120, key: 'vZt', render: (h, params) => {-->
                            <!--let zts = params.row.vZt.split('');-->
                            <!--let ztss = '';-->
                            <!--for (let r of zts) {-->
                                <!--let val = $.map(this.dicts.clzt.items, item => {-->
                                    <!--if (item.key === r) {-->
                                        <!--ztss += item.val + ',';-->
                                    <!--}-->
                                <!--});-->
                            <!--}-->
                            <!--if (ztss.charAt(ztss.length - 1) === ',') {-->
                                <!--ztss = ztss.substring(0, ztss.length - 1);-->
                            <!--}-->
                            <!--return h('div', ztss);-->
                        <!--}-->
                    <!--},-->
                    <!--{title: '初登日期', width: 120, key: 'vCcdjrq'},-->
                    <!--{-->
                        <!--title: '年审日期', width: 180, key: 'vNsrq', render: (h, params) => {-->
                            <!--let today = new Date().format("yyyy-MM-dd");-->
                            <!--let f = today >= params.row.vNsrq;-->
                            <!--let content = "请尽快完成年审";-->
                            <!--let color = "red";-->
                            <!--if (!f) {-->
                                <!--color = "green";-->
                                <!--content = "暂不需要年审";-->
                            <!--}-->

                            <!--return h('Tooltip', {-->
                                <!--props: {-->
                                    <!--trigger: 'hover',-->
                                    <!--content: content,-->
                                    <!--placement: 'bottom'-->
                                <!--}-->
                            <!--}, [-->
                                <!--h('Tag', {-->
                                    <!--props: {-->
                                        <!--type: 'dot',-->
                                        <!--color: color-->
                                    <!--}-->
                                <!--}, params.row.vNsrq)-->
                            <!--]);-->
                        <!--},-->
                        <!--filters: [-->
                            <!--{-->
                                <!--label: '超期未年审',-->
                                <!--value: 1-->
                            <!--}-->
                        <!--],-->
                        <!--filterMultiple: false,-->
                        <!--filterMethod(value, row) {-->
                            <!--let today = new Date().format("yyyy-MM-dd");-->
                            <!--let f = today >= row.vNsrq;-->
                            <!--if (!f) {-->
                                <!--return false;-->
                            <!--}-->

                            <!--return true;-->
                        <!--}-->
                    <!--},-->
                    <!--{-->
                        <!--title: '运营证', width: 120, key: 'yyzFlag', render: (h, params) => {-->
                            <!--let flag = params.row.yyzFlag;-->
                            <!--if (flag) {-->
                                <!--return h('Tag', {-->
                                    <!--props: {-->
                                        <!--type: 'dot',-->
                                        <!--color: 'green'-->
                                    <!--}-->
                                <!--}, '已传');-->
                            <!--}-->

                            <!--return h('Tag', {-->
                                <!--props: {-->
                                    <!--type: 'dot'-->
                                <!--}-->
                            <!--}, '未传');-->
                        <!--}-->
                    <!--},-->
                    <!--{title: '责任人', width: 120, key: 'vZrr'},-->
                    <!--{title: '责任人电话', width: 120, key: 'vZrrlxdh'},-->
                    <!--{title: '所有人', key: 'vSyl'},-->
                    <!--{-->
                        <!--title: '使用人', key: 'vLxr', render: (h, params) => {-->
                            <!--let lxr = params.row.vLxr;-->

                            <!--if (lxr) {-->
                                <!--lxr = lxr.split("-")[1];-->
                            <!--} else {-->
                                <!--lxr = '-';-->
                            <!--}-->
                            <!--return h('div', lxr);-->
                        <!--}-->
                    <!--},-->
                    <!--{-->
                        <!--title: '操作',-->
                        <!--key: 'action',-->
                        <!--fixed: 'right',-->
                        <!--width: 280,-->
                        <!--align: 'center',-->
                        <!--render: (h, params) => {-->
                            <!--return h('div', [-->
                                <!--this.util.buildEditButton(this, h, params),-->
                                <!--this.util.buildButton(this, h, 'info', 'ios-list-outline', '车辆详情', () => {-->
                                    <!--this.showClxqPage(params)-->
                                <!--}),-->
                                <!--// this.util.buildButton(this, h, 'info', 'calendar', '车辆年审', ()=>{this.showNsPage(params)}),-->
                                <!--this.util.buildButton(this, h, 'info', 'person', '车辆分配', () => {-->
                                    <!--this.toPerson(params)-->
                                <!--}),-->
                                <!--this.util.buildButton(this, h, 'info', 'ios-eye', '证件照片', () => {-->
                                    <!--this.showImgFile(params)-->
                                <!--}),-->
                                <!--// this.util.buildButton(this, h, 'info', 'printer', '年审打印', ()=>{this.showNsdyPage(params)}),-->
                                <!--// this.util.buildButton(this, h, 'info', 'email', '年审通知', ()=>{this.showDxtzPage(params)}),-->

                                <!--this.util.buildDeleteButton(this, h, params.row.vId),-->
                            <!--]);-->
                        <!--}-->
                    <!--}-->
                <!--],-->
                <!--foreignList:{-->
                    <!--vLxr:{url:this.apis.USER.QUERY,key:'yhid',val:'xm',items:[]},-->
                <!--},-->
                <!--pageData: [],-->
                <!--form: {-->
                    <!--vSylLike:'',-->
                    <!--total: 0,-->
                    <!--pageNum: 1,-->
                    <!--pageSize: 8,-->
                <!--},-->
            <!--}-->
        <!--},-->
        <!--created() {-->
            <!--this.today = new Date().format("yyyy-MM-dd");-->
            <!--this.util.initTable(this)-->
        <!--},-->
        <!--methods: {-->
            <!--pageChange(event) {-->
                <!--this.util.pageChange(this, event);-->
            <!--},-->
            <!--//年审打印-->
            <!--showNsdyPage(param){-->
                <!--let v = this;-->
                <!--swal.showLoading();-->
                <!--v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vId).then((res) =>{-->
                    <!--if (res.code === 200 && res.result != null && res.result.length > 0){-->
                        <!--this.xszPrintImgs = res.result;-->

                        <!--v.$http.get(v.apis.FILE.FINDBYPID + '/' + param.row.vLxr.split('-')[0]).then((res) =>{-->
                            <!--swal.close();-->

                            <!--this.jszPrintImgs = res.result;-->
                            <!--setTimeout(()=>{-->
                                <!--printJS({-->
                                    <!--printable: 'printDiv',-->
                                    <!--type: 'html'-->
                                <!--});-->
                            <!--}, 800);-->
                        <!--}, (error)=>{-->
                            <!--swal({-->
                                <!--text: '网络异常',-->
                                <!--type: 'error'-->
                            <!--})-->
                        <!--});-->
                    <!--}else{-->
                        <!--swal({-->
                            <!--text: "请先上传证件！",-->
                            <!--type: "error"-->
                        <!--})-->
                    <!--}-->
                <!--}, (error)=>{-->
                    <!--swal({-->
                        <!--text: '网络异常',-->
                        <!--type: 'error'-->
                    <!--})-->
                <!--})-->
            <!--},-->
            <!--//年审通知-->
            <!--showDxtzPage(param){-->
                <!--let v = this;-->
                <!--swal.queue([{-->
                    <!--text: "确认发送年审通知短信?",-->
                    <!--type: "warning",-->
                    <!--showCancelButton: true,-->
                    <!--confirmButtonText: '确认',-->
                    <!--cancelButtonText: '取消',-->
                    <!--showLoaderOnConfirm: true,-->
                    <!--preConfirm: function () {-->
                        <!--return new Promise(function (resolve) {-->
                            <!--v.$http.get(v.apis.CAR.SENDSMS + param.row.vId).then((res) =>{-->
                                <!--let type = "success";-->
                                <!--if(res.code !== 200){-->
                                    <!--type = "error";-->
                                <!--}-->
                                <!--swal.insertQueueStep({-->
                                    <!--text: res.message,-->
                                    <!--type: type-->
                                <!--})-->

                                <!--resolve();-->
                            <!--}, (error)=>{-->
                                <!--swal.insertQueueStep({-->
                                    <!--text: '网络异常',-->
                                    <!--type: 'error'-->
                                <!--})-->
                                <!--resolve();-->
                            <!--})-->
                        <!--})-->
                    <!--}-->
                <!--}]);-->
            <!--}-->
        <!--}-->
    <!--}-->
<!--</script>-->


<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Form :label-width="100">
        <Row>
            <!--<span style="font-size: 14px;">临期年审</span>-->
            <Col span="4">
            <FormItem label="选项">
            <Select clearable v-model="form.vAzkj" placeholder="请选择...">
            <Option value="0">临期年审</Option>
            <Option value="1">逾期年审</Option>
            <Option value="2">交强险临期</Option>
            <Option value="3">商业险临期</Option>
            <Option value="4">强制报废</Option>
            </Select>
            </FormItem>
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

    export default {
        name: 'byxxTable',
        data() {
            return {
                v:this,
                SpinShow: true,
                pagerUrl:this.apis.CAR.QUERY+'?lqnj=lqnj',
                tableHeight: 220,
                componentName: '',
                choosedItem: null,
                dateRange:'',
                tableColumns: [
                    {title: "序号", width: 60, type: 'index'},
                    {title: '车牌号', width: 120, key: 'vHphm', searchKey: 'vHphm'},
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
                    {title: '初登日期', width: 120, key: 'vCcdjrq'},
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
                    byBysjInRange:'',
                    orderBy:'vNsrq desc',
                    total: 0,
                    pageNum: 1,
                    pageSize: 5,
                },
            }
        },
        created() {
            this.util.initSimpleTable(this)
            this.tableHeight = window.innerHeight - 250;
        },
        methods: {
            pageChange(event) {
                this.util.pageChange(this, event);
            }
        }
    }
</script>
