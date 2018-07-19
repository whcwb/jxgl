<style lang="less">
    @import '../../../../styles/common.less';
</style>

<template>
    <div>
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" title="单据查看">
            <Row style="padding-bottom: 15px">
                <Col span="12">
                    <label>入库单</label>
                    <img v-if="showRkd" :src="'/image/'+rkdPath" style="width: 100%"></img>
                </Col>
                <Col span="12">
                    <label>出库单</label>
                    <img v-if="showCkd" :src="'/image/'+ckdPath" style="width: 100%"></img>
                </Col>
            </Row>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
            </div>
        </Modal>
    </div>
</template>

<script>
    import formItems from '../../components/formItems'
    import Cookies from 'js-cookie';

    export default {
        name: 'usecarForm',
        components: {formItems},
        data() {
            return {
                v: this,
                uploadUrl: this.apis.FILE.UPLOAD,
                showModal: true,
                rkdPath:'',
                ckdPath:'',
                showRkd:false,
                showCkd:false,
                item:''
            }
        },
        created() {
            this.item = this.$parent.choosedRow;
            console.log(this.item);
            this.getData();
        },
        methods: {
            getData(){
                this.$http.get(this.apis.FILE.FINDBYPID+'/'+this.item.clId).then((res)=>{
                    if (res.code === 200 && res.result){
                        for (let r of res.result){
                            if (r.vfDamc === 'rkdFile'){
                                this.rkdPath = r.vfNetPath;
                                this.showRkd = true;
                            }else if (r.vfDamc === 'ckdFile'){
                                this.ckdPath = r.vfNetPath;
                                this.showCkd = true;
                            }
                        }
                    }
                })
            }
        }
    }
</script>

<style>

</style>
