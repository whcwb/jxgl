<style lang="less">
    @import '../../../../styles/common.less';
</style>
<template>
    <div class="boxbackborder">
        <Form :model="form" :label-width="80">
            <Row>
                <Col span="6">
                    <FormItem label='车牌号：'>
                        <Input type="text" v-model="form.vHphm"></Input>
                    </FormItem>
                </Col>
                <Col span="4">
                    <Button type="primary" @click="getVid">
                        <Icon type="search"></Icon>
                    </Button>
                </Col>
            </Row>
        </Form>
        <Row v-if="showFiles" style="padding-bottom: 15px">
            <Card dis-hover>
                <Row>
                    <Col v-for="(item,key) in  files" span="6" :key="key">
                        <div style="text-align:center;margin-top: 16px">
                            <div class="demo-upload-list" v-if="item.uploadFile != null">
                                <template v-if="item.uploadFile.status === 'finished'">
                                    <img :src="item.uploadFile.url">
                                    <div class="demo-upload-list-cover">
                                        <Icon type="ios-printer-outline" size="32"  ref="'img_'+key" :id="'img_'+key"
                                              @click.native="handlePrint(item.uploadFile.url)"></Icon>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <Icon type="ios-eye-outline" size="32"
                                              @click.native="handleView(item.uploadFile.url)"></Icon>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <Icon type="refresh" size="32"
                                              @click.native="handleRemove(item.uploadFile)"></Icon>
                                    </div>
                                </template>
                                <template v-else>
                                    <Progress :percent="item.uploadFile.percentage"
                                              hide-info></Progress>
                                </template>
                            </div>
                            <Upload
                                    v-show="item.uploadFile == null"
                                    ref="upload"
                                    :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                    :show-upload-list="false"
                                    :on-success="(res, file,fileList)=>{successCallback(res, file,key)}"
                                    :on-error="errorCallback"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="8192"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    type="drag"
                                    :action="uplaodUrl+'/'+form.vId+'/20/'+key+'?targetPath='+key"
                                    style="display: inline-block;width:180px;height:180px">
                                <div style="width: 180px;height:180px;line-height: 200px;">
                                    <Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
                                </div>
                            </Upload>
                            <h3>{{item.title}}</h3>
                        </div>
                    </Col>
                    <Col span="6" style="text-align: center;">
                        <div style="text-align:center;margin:16px auto 0 auto;width: 180px;height: 180px" @click="componentName = 'printChange'">
                            <Card  style="text-align:center;margin-top: 16px;width: 180px;height: 180px;">
                                <div style="text-align:center">
                                    <img src="../../../../../static/excel.jpg" style="width:100%">
                                </div>
                            </Card>
                            <h3 style="margin-top: 10px;">车辆异动表下载</h3>
                        </div>
                    </Col>
                </Row>
                <Row>
                    <Col span="24">

                    </Col>
                </Row>
            </Card>
        </Row>
        <Row v-if="showFiles">
            <Card>
                <p slot="title">
                    [{{form.vHphm}}]保险档案文件
                </p>
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
                                <Progress :percent="item.percentage" hide-info></Progress>
                            </template>
                        </div>
                    </Col>
                </Row>
            </Card>
        </Row>
        <component :is="componentName"></component>
        <Modal title="图片预览" v-model="visible" >
            <img :src="imgUrl" v-if="visible" style="width: 100%">
            <div slot="footer"></div>
        </Modal>
    </div>
</template>

<script>
    import Cookies from 'js-cookie';
    import swal from 'sweetalert2'
    import printChange from './printChange'
    import Print from 'print-js'
    import $ from 'jquery'

    export default {
        name: 'wfxx',
        components: {printChange},
        data() {
            return {
                v: this,
                showFiles: false,
                componentName: '',
                staticPath: this.apis.STATIC_PATH,
                SpinShow: true,
                form: {
                    vHphm: ''
                },
                uplaodUrl: this.apis.FILE.UPLOAD,
                files: {
                    xszzmFile: {title: '行车证', uploadFile: null},
                    xszfbFile: {title: '行车证副本盖章记录', uploadFile: null},
                    cqdjzFile: {title: '登记证书', uploadFile: null},
                    // bdFile: {title: '保单', uploadFile: null},
                    cqdjFile: {title: '内部车辆产权登记', uploadFile: null},
                    claqxyFile: {title: '车辆安全协议', uploadFile: null},
                    gzbFile: {title: '告知表', uploadFile: null}
                },
                curUser: '',
                car: '',
                insurance:'',
                visible:false,
                imgUrl: '',
                uploadUrl:this.apis.FILE.UPLOAD,
                defaultList: [],
                imgName: '',
                uploadList: []
            }
        },
        created() {
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
        },
        methods: {
            getVid() {
                if (this.form.vHphm === '') {
                    this.$Message.error('请输入车牌号');
                    return;
                }
                this.car = null;
                this.showFiles = false;
                this.$http.get(this.apis.CAR.QUERY + '?vHphm=' + this.form.vHphm).then((res) => {
                    if (res.code === 200 && res.page && res.page.list && res.page.list.length > 0) {
                        this.car = res.page.list[0];
                        this.getInsuranceData();
                        this.form.vId = this.car.vId;
                        this.getData();
                    } else {
                        this.$Message.error('未找到车辆');
                    }
                })
            },
            getInsuranceData(){
                if (!this.car.inId)return;
                this.$http.get(this.apis.FILE.FINDBYPID + '/' + this.car.inId).then((res) => {
                    if (res.code === 200) {
                        if (res.result){
                            for (let r of res.result) {
                                try{
                                    this.uploadList.push({
                                        name:r.vfDamc,
                                        status:'finished',
                                        url:this.apis.STATIC_PATH + r.vfNetPath + '?d='+new Date().getTime()
                                    })
                                }catch (e){

                                }
                            }
                        }
                        this.showFiles = true;
                    } else {
                        this.$Message.error('未找到文件');
                        this.showFiles = false;
                    }
                    console.log(this.uploadList);
                })
            },
            getData() {
                for (let k in this.files){
                    this.files[k].uploadFile = null;
                }
                this.$http.get(this.apis.FILE.FINDBYPID + '/' + this.car.vId).then((res) => {
                    if (res.code === 200) {
                        if (res.result){
                            for (let r of res.result) {
                                try{
                                    this.files[r.vfDamc].uploadFile = {
                                        name:r.vfDamc,
                                        status:'finished',
                                        url:this.apis.STATIC_PATH + r.vfNetPath + '?d='+new Date().getTime()
                                    };
                                }catch (e){

                                }
                            }
                        }
                        this.showFiles = true;
                    } else {
                        this.$Message.error('未找到文件');
                        this.showFiles = false;
                    }
                    console.log(this.files);
                })
            },
            handlePrint(url) {
                setTimeout(()=>{
                    Print({
                        printable: url,
                        type: 'image',
                    });
                }, 1000);
            },
            handleView(url) {
                this.imgUrl = url;
                this.visible = true;
            },
            //文件上传成功后，回调该方法，进行后续处理
            successCallback(res, file, locDataName) {
                if (res.code == 200) {
                    //拼接文件全路径url
                    file.url = this.apis.STATIC_PATH + res.message;
                    //重新给name赋值，以便预览图片和删除文件时使用
                    file.name = locDataName;
                    //将文件对象和data的属性进行绑定
                    this.files[locDataName].uploadFile = file;
                    // this.$data[locDataName] = file;
                } else {
                    this.$Message.error("文件上传失败：" + res.message);
                }
            },
            handleSuccess (res, file, fileList) {
                if (res.code == 200){
                    //拼接文件全路径url
                    file.url = this.apis.STATIC_PATH + res.message;
                }else{
                    this.$Message.error("文件上传失败："+res.message);
                }
            },
            //文件上传成功后，回调该方法，进行后续处理
            errorCallback(res, file, locDataName) {
                this.$Message.error("文件上传失败，请稍后重试！");
            },
            handleRemove(file) {
                this.files[file.name].uploadFile = null;
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
<style scoped>
    .demo-upload-list{
        display: inline-block;
        width: 260px;
        height: 180px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent;
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        padding-top: 60px;
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 0 2px;
    }
</style>
