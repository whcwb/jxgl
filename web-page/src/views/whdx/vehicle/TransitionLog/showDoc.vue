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
                    <Row style="height:400px;">
                        <img v-if="showRkd" :src="'/image/'+rkdPath" style="width: 100%"></img>
                    </Row>
                    <Row>
                        <div v-if="showRkdOtherFile" class="demo-upload-list" v-for="item in rkdFilesList">
                            <template >
                                <img :src="apis.STATIC_PATH + item.url">
                                <div class="demo-upload-list-cover">
                                    <Icon type="ios-eye-outline" size="20" @click.native="handleView(apis.STATIC_PATH + item.url)"></Icon>
                                </div>
                            </template>
                        </div>
                    </Row>
                </Col>
                <Col span="12">
                    <label>出库单</label>
                    <Row style="height:400px;">
                        <img v-if="showCkd" :src="'/image/'+ckdPath" style="height: 100%;width:100%"></img>
                    </Row>
                    <Row>
                        <div v-if="showCkdOtherFile" class="demo-upload-list" v-for="item in ckdFilesList">
                            <template >
                                <img :src="apis.STATIC_PATH + item.url">
                                <div class="demo-upload-list-cover">
                                    <Icon type="ios-eye-outline" size="20" @click.native="handleView(apis.STATIC_PATH + item.url)"></Icon>
                                </div>
                            </template>
                        </div>
                    </Row>
                </Col>
            </Row>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
            </div>
        </Modal>
        <Modal title="图片预览" v-model="visible">
            <img :src="imgUrl" v-if="visible" style="width: 100%">
            <div slot="footer"></div>
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
                visible:false,
                imgUrl:'',
                uploadUrl: this.apis.FILE.UPLOAD,
                showModal: true,
                rkdPath:'',
                ckdPath:'',
                showRkd:false,
                showCkd:false,
                item:'',
                rkdFilesList:[],
                ckdFilesList:[],
                showRkdOtherFile:false,
                showCkdOtherFile:false,
            }
        },
        created() {
            this.item = this.$parent.choosedRow;
            this.getData();
        },
        methods: {
            handleView (url) {
                this.imgUrl = url;
                this.visible = true;
            },
            getData(){
                this.rkdFilesList = [];
                this.ckdFilesList = [];
                this.$http.get(this.apis.FILE.FINDBYPID+'/'+this.item.clId).then((res)=>{
                    if (res.code === 200 && res.result){
                        for (let r of res.result){
                            if (r.vfDamc === 'rkdFile'){
                                this.rkdPath = r.vfNetPath;
                                this.showRkd = true;
                            }else if (r.vfDamc === 'ckdFile'){
                                this.ckdPath = r.vfNetPath;
                                this.showCkd = true;
                            }else if (r.vfDamc === 'ckdOtherFile'){
                                this.ckdFilesList.push({url:r.vfNetPath});
                                this.showCkdOtherFile = true;
                            }else if (r.vfDamc === 'rkdOtherFile'){
                                this.rkdFilesList.push({url:r.vfNetPath});
                                this.showRkdOtherFile = true;
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
