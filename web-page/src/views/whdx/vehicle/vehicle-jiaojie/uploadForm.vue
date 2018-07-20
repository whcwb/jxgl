<style lang="less">
    @import '../../../../styles/common.less';
</style>

<template>
    <div>
        <Modal v-model="showModal" width='600' :closable='false'
               :mask-closable="false" title="单据回传">
            <Row style="padding-bottom: 15px;text-align: center">
                <Row>
                    <Col span="24">
                        <label>单据类型</label>
                        <RadioGroup v-model="fileType">
                            <Radio label="in">入库</Radio>
                            <Radio label="out">出库</Radio>
                        </RadioGroup>
                    </Col>
                </Row>
                <br>
                <Row>
                    <Col span="24" v-show="fileType === 'in'">
                        <div style="text-align:center">
                            <Upload
                                    v-show="uploadFile == null"
                                    ref="upload"
                                    :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                    :show-upload-list="false"
                                    :on-success="(res, file,fileList)=>{successCallback(res, file,'uploadFile')}"
                                    :on-error="errorCallback"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    type="drag"
                                    :action="uploadUrl+'/'+formItem.vId+'/20/rkdFile?targetPath=rkdFile'"
                                    style="display: inline-block;width:180px;height:180px">
                                <div style="width: 180px;height:180px;line-height: 200px;">
                                    <Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
                                </div>
                            </Upload>
                            <h3>入库单</h3>
                        </div>
                        <Row>
                            <Col span="12">
                                <div class="demo-upload-list" v-for="item in uploadList">
                                    <template v-if="item.status === 'finished'">
                                        <img :src="item.url">
                                        <div class="demo-upload-list-cover">
                                            <Icon type="ios-eye-outline" size="20" @click.native="handleView(item.url)"></Icon>
                                            <Icon type="ios-trash-outline" size="20" @click.native="handleRemove(item)"></Icon>
                                        </div>
                                    </template>
                                    <template v-else>
                                        <Progress v-if="item.showProgress" :percent="item.percentage" hide-info></Progress>
                                    </template>
                                </div>
                                <Upload
                                        ref="upload"
                                        :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                        :show-upload-list="false"
                                        :default-file-list="defaultList"
                                        :on-success="handleSuccess"
                                        :format="['jpg','jpeg','png']"
                                        :max-size="8196"
                                        :on-format-error="handleFormatError"
                                        :on-exceeded-size="handleMaxSize"
                                        multiple
                                        type="drag"
                                        :action="uploadUrl+'/'+formItem.vId+'/20/rkdOtherFile?targetPath=rkdOtherFile&batch=true'"
                                        style="display: inline-block;width:58px;">
                                    <div style="width:58px;height:58px;line-height: 58px;">
                                        <Icon type="camera"></Icon>
                                    </div>
                                </Upload>
                            </Col>
                        </Row>
                    </Col>
                    <Col span="24" v-show="fileType === 'out'">
                        <div style="text-align:center">
                            <Upload
                                    v-show="uploadFile == null"
                                    ref="upload"
                                    :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                    :show-upload-list="false"
                                    :on-success="(res, file,fileList)=>{successCallback(res, file,'uploadFile')}"
                                    :on-error="errorCallback"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    type="drag"
                                    :action="uploadUrl+'/'+formItem.vId+'/20/ckdFile?targetPath=ckdFile'"
                                    style="display: inline-block;width:180px;height:180px">
                                <div style="width: 180px;height:180px;line-height: 200px;">
                                    <Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
                                </div>
                            </Upload>
                            <h3>出库单</h3>
                        </div>
                        <Row>
                            <Col span="12">
                                <Upload
                                        ref="upload"
                                        :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                        :show-upload-list="true"
                                        :on-success="handleSuccess"
                                        :format="['jpg','jpeg','png']"
                                        :max-size="8196"
                                        :on-format-error="handleFormatError"
                                        :on-exceeded-size="handleMaxSize"
                                        multiple
                                        type="drag"
                                        :action="uploadUrl+'/'+formItem.vId+'/20/ckdOtherFile?targetPath=ckdOtherFile&batch=true'"
                                        style="display: inline-block;width:58px;">
                                    <div style="width:58px;height:58px;line-height: 58px;">
                                        <Icon type="camera"></Icon>
                                    </div>
                                </Upload>
                            </Col>
                        </Row>
                    </Col>
                </Row>
            </Row>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
                <Button type="primary" @click="confirm">确定</Button>
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
                uploadUrl: this.apis.FILE.UPLOAD,
                defaultList: [],
                uploadList:[],
                showModal: true,
                readonly: false,
                fileType: 'in',
                formItem: {},
                ruleInline: {},
                uploadFile: null,
                curUser: {},
                filePath:'',
                otherFiles:'',
                visible:false,
            }
        },
        created() {
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
            this.formItem.vId = this.$parent.choosedRow.vId;
        },
        methods: {
            confirm(){
                let p = {
                    clId:this.formItem.vId,
                    type:this.fileType,
                    filePath:this.filePath,
                    otherFiles:this.otherFiles,
                }
                console.log(p);
                this.$http.post(this.apis.CAR.uploadBill,p).then((res)=>{
                    if (res.code === 200){
                        this.$Message.success(res.message);
                        this.util.getPageData(this.$parent)
                        this.$parent.componentName = ''
                    }else{
                        this.$Message.error(res.message);
                    }
                })
            },
            typeChange(o) {
                console.log(o);
            },
            //文件上传成功后，回调该方法，进行后续处理
            successCallback(res, file, locDataName) {
                if (res.code == 200) {
                    //拼接文件全路径url
                    this.filePath = res.message;
                    file.url = this.apis.STATIC_PATH + res.message;
                    //重新给name赋值，以便预览图片和删除文件时使用
                    file.name = locDataName;
                    //将文件对象和data的属性进行绑定
                    this.$data[locDataName] = file;
                    console.log(file);
                } else {
                    this.$Message.error("文件上传失败：" + res.message);
                }
            },
            handleView (url) {
                this.imgUrl = url;
                this.visible = true;
            },
            handleSuccess (res, file, fileList) {
                this.otherFiles = '';
                if (res.code == 200){
                    //拼接文件全路径url
                    file.url = this.apis.STATIC_PATH + res.message;
                    let p = '';
                    for (let r of fileList){
                        p += r.response.message+",";
                    }
                    this.otherFiles = p;
                }else{
                    this.$Message.error("文件上传失败："+res.message);
                }
            },
            //文件上传成功后，回调该方法，进行后续处理
            errorCallback(res, file, locDataName) {
                this.$Message.error("文件上传失败，请稍后重试！");
            },
            handleRemove(file) {
                this.$data[file.name] = null;
            },
            handleFormatError(file) {
                this.$Notice.warning({
                    title: '文件格式错误',
                    desc: '图片仅支持 jpg、jpeg、png'
                });
            },
            handleMaxSize(file) {
                this.$Notice.warning({
                    title: '文件太大了',
                    desc: '文件不能超过18M'
                });
            }

        }
    }
</script>

<style>

</style>
