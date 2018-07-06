<style lang="less">
    @import '../../../../styles/common.less';
</style>
<style>
    #printDiv table {
        border: 1px solid #000;
    }

    #printDiv table tr th {
        border: 1px solid #000;
    }

    #printDiv table tr td {
        border: 1px solid #000;
    }

    #printDiv table {
        width: 800px;
        min-height: 28px;
        line-height: 28px;
        text-align: left;
        border-collapse: collapse;
        padding: 2px;
    }

    #printDiv table td {
        padding-left: 10px;
    }

    #printDiv table .title {
        text-align: center
    }

    #printDiv table .check {
        width: 50px;
        text-align: center;
    }

    #printDiv .width100 {
        width: 400px;
    }

    #printDiv .col25 {
        width: 25%;
    }

    #printDiv .width2 {
        width: 100px;
    }

    #printDiv .width3 {
        width: 200px;
    }

    #printDiv .width4 {
        width: 150px;
    }
    #printDiv .col1 {
        width: 35px;
    }
    #printDiv .col2 {
        width: 60px;
    }
    #printDiv .col4 {
        width: 500px;
        height: 200px;
    }
    #printDiv .col5 {
        width: 600px;
        height: 200px;
    }

    #printDiv .div_qz {
        margin-top: 200px;
        text-align: right;
        padding: 20px;
    }
    #printDiv .div_qz span{
        margin-right: 40px;
        text-align: right;
    }
    #printDiv .div_qz div{
        text-align: right;
        margin-top: 20px;
    }


</style>

<template>
    <div id="tabS">
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" title="单据打印">
            <div id="printDiv" ref="printDiv" style="left:0;top:0;z-index: 10">
                <table>
                    <caption><h4>教练车转移登记申请表</h4></caption>
                    <tbody>
                    <tr>
                        <td colspan="3" class="col25">牌照号</td>
                        <td class="col25">{{cph}}</td>
                        <td colspan="2" class="col25">号牌种类</td>
                        <td colspan="1" class="col25"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col25">车辆型号</td>
                        <td class="col25"></td>
                        <td colspan="2" class="col25">发动机号</td>
                        <td colspan="1" class="col25"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col25">车架号</td>
                        <td class="col25"></td>
                        <td colspan="2" class="col25">初次登记日期</td>
                        <td colspan="1" class="col25"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col25">检验有效期止</td>
                        <td class="col25"></td>
                        <td colspan="2" class="col25">机动车状态</td>
                        <td colspan="1" class="col25"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col25">拟转出驾校名称</td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="col25">拟转入驾校名称</td>
                        <td colspan="4"></td>
                    </tr>
                    <tr>
                        <td colspan="1" class="col1">车辆转出驾校意见</td>
                        <td colspan="3" class="col4">
                            <div class=" div_qz">
                                <div>
                                    <span>经办人：</span>
                                    <span>（签章）</span>
                                </div>
                                <br>
                                <div>
                                    <span>年</span>
                                    <span>月</span>
                                    <span>日</span>
                                </div>
                            </div>
                        </td>
                        <td colspan="1" class="col1">车辆转入驾校意见</td>
                        <td colspan="2" class="col4">

                            <div class=" div_qz">
                                <div>
                                    <span>经办人：</span>
                                    <span>（签章）</span>
                                </div>
                                <br>
                                <div>
                                    <span>年</span>
                                    <span>月</span>
                                    <span>日</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="col2">受理岗审核意见</td>
                        <td colspan="5" class="col5"></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="col2">考务科意见</td>
                        <td colspan="5" class="col5">

                            <div class=" div_qz">
                                <div>
                                    <span>经办人：</span>
                                    <span>（签章）</span>
                                </div>
                                <br>
                                <div>
                                    <span>年</span>
                                    <span>月</span>
                                    <span>日</span>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
                <Button type="primary" @click="print">打印</Button>
            </div>

        </Modal>
    </div>
</template>

<script>
    import formItems from '../../components/formItems'
    import Print from 'print-js'

    export default {
        name: 'usecarForm',
        components: {formItems},
        data() {
            return {
                v: this,
                showModal: true,
                readonly: false,
                formItem: {},
                ruleInline: {},
                cph: ''
            }
        },
        created() {
            this.cph = this.$parent.choosedRow.vHphm;
        },
        methods: {
            print() {
                Print({
                    printable: 'printDiv',
                    type: 'html',
                    // onLoadingStart: () => {
                    //     this.$refs.printDiv.style = "display:block";
                    // },
                    // onLoadingEnd: () => {
                    //     this.$refs.printDiv.style = "display:none";
                    // }
                });
            }

        }
    }
</script>

<style>

</style>
