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

    #printDiv .width2 {
        width: 100px;
    }

    #printDiv .width3 {
        width: 200px;
    }

    #printDiv .width4 {
        width: 150px;
    }

</style>

<template>
    <div id="tabS">
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" title="单据打印">
            <div id="printDiv" ref="printDiv" style="left:0;top:0;z-index: 10">
                <table>
                    <caption><h4>车辆交接确认书</h4></caption>
                    <tbody>
                    <tr>
                        <td class="width4">车辆车牌号</td>
                        <td class="width3">{{cph}}</td>
                        <td class="width2">接车方</td>
                        <td colspan="2" class="width100"></td>
                    </tr>
                    <tr>
                        <td colspan="1">交接类别</td>
                        <td class="width3">▢交车&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp▢接车</td>
                        <td class="width2">接车基地</td>
                        <td colspan="2" class="width100"></td>
                    </tr>
                    <tr>
                        <td colspan="5"><br></td>
                    </tr>

                    <tr>
                        <td colspan="5">证件&钥匙交接</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">行车证原件</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">保单复印件</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">钥匙（&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp）把</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td colspan="5">车辆交接</td>
                    </tr>
                    <tr>
                        <td>车辆外观</td>
                        <td colspan="3">车辆表面无破损、剐蹭、脱落</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td>车辆清洁</td>
                        <td colspan="3">车辆外部清洁无黏土</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">车辆内部清洁无杂物</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">内部桌垫、脚垫干净整洁</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td colspan="5">车辆安全</td>
                    </tr>

                    <tr>
                        <td colspan="1"></td>
                        <td colspan="3">安全带是否正常</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">是否有副后视镜</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">是否有垫木</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">开关门锁是否正常</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">防盗器正常</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td colspan="5">车辆工况</td>
                    </tr>

                    <tr>
                        <td colspan="1"></td>
                        <td colspan="3">喇叭、灯光齐全有效，雨刮性能良好</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">仪表与操作台工作正常</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">刹车制动可靠、灵敏，刹车踏板自由，制动距离是否达到安全规定要求、手刹是否可靠有效</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">轮胎及备胎气压正常，轮胎螺丝不缺不松，轮胎无严重磨损</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">注意排气颜色是否正常</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">运转声音是否正常，润滑油是否合适</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">发动机运转正常，无异响与异味</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">排气无冒黑烟与蓝烟现象</td>
                        <td class="check">▢</td>
                    </tr>

                    <tr>
                        <td colspan="5">应急物品</td>
                    </tr>

                    <tr>
                        <td colspan="1"></td>
                        <td colspan="3">停车牌、千斤顶、轮胎扳手等工具齐全</td>
                        <td class="check">▢</td>
                    </tr>
                    <tr>
                        <td class="firstBlank"></td>
                        <td colspan="3">灭火器等消防设施配备、并处于可用状态</td>
                        <td class="check">▢</td>
                    </tr>


                    <tr>
                        <td colspan="5"><br></td>
                    </tr>
                    <tr style="height: 50px;">
                        <td colspan="1">接车时间</td>
                        <td colspan="4"></td>
                    </tr>
                    <tr style="height: 50px;">
                        <td colspan="1">接车双方签字确认</td>
                        <td colspan="4" rowspan="2"></td>
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
                printJS({
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
