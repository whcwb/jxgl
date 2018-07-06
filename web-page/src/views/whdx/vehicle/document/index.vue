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
                    <Col v-for="(item,index) in  files" span="6" :key="index">
                        <div style="text-align:center;margin-top: 16px">
                            <div class="demo-upload-list" v-if="item.uploadFile != null">
                                <template v-if="item.uploadFile.status === 'finished'">
                                    <img :src="staticPath + item.uploadFile.url">
                                    <div class="demo-upload-list-cover">
                                        <Icon type="ios-eye-outline" size="32" :id="'img_'+index"
                                              @click.native="handlePrint('img_'+index)"></Icon>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <Icon type="ios-eye-outline" size="32"
                                              @click.native="handleView(staticPath  + item.uploadFile.url)"></Icon>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <Icon type="refresh" size="32"
                                              @click.native="handleRemove(item.uploadFile)"></Icon>
                                    </div>
                                </template>
                                <template v-else>
                                    <Progress v-if="item.uploadFile.showProgress" :percent="item.uploadFile.percentage"
                                              hide-info></Progress>
                                </template>
                            </div>
                            <Upload
                                    v-show="item.uploadFile == null"
                                    ref="upload"
                                    :headers="{'userid':curUser.userId, 'token':curUser.token}"
                                    :show-upload-list="false"
                                    :on-success="(res, file,fileList)=>{successCallback(res, file,index)}"
                                    :on-error="errorCallback"
                                    :format="['jpg','jpeg','png']"
                                    :max-size="2048"
                                    :on-format-error="handleFormatError"
                                    :on-exceeded-size="handleMaxSize"
                                    type="drag"
                                    :action="item.action"
                                    style="display: inline-block;width:180px;height:180px">
                                <div style="width: 180px;height:180px;line-height: 200px;">
                                    <Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
                                </div>
                            </Upload>
                            <h3>{{item.title}}</h3>
                        </div>
                    </Col>
                </Row>
            </Card>

            <Col>
                <Button @click="componentName = 'printChange'">车辆异动</Button>
            </Col>
        </Row>
        <component :is="componentName"></component>
    </div>
</template>

<script>
    import Cookies from 'js-cookie';
    import swal from 'sweetalert2'
    import printChange from './printChange'
    import Print from 'print-js'

    export default {
        name: 'wfxx',
        components: {printChange},
        data() {
            return {
                v: this,
                showFiles: false,
                componentName: '',
                staticPath:this.apis.STATIC_PATH,
                SpinShow: true,
                form: {
                    vHphm: ''
                },
                files: {
                    xszzmFile: {title: '行车证', uploadFile: null, action: '', showProgress: true, percentage: true},
                    djzsFile: {title: '登记证书', uploadFile: null, action: '', showProgress: true, percentage: true},
                    bdFile: {title: '保单', uploadFile: null, action: '', showProgress: true, percentage: true},
                    cqdjFile: {title: '内部车辆产权登记', uploadFile: null, action: '', showProgress: true, percentage: true},
                    aqxyFile: {title: '车辆安全协议', uploadFile: null, action: '', showProgress: true, percentage: true},
                    gzbFile: {title: '告知表', uploadFile: null, action: '', showProgress: true, percentage: true}
                },
                curUser: '',
                car: '',
            }
        },
        created() {
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
        },
        methods: {
            getVid(){
                if (this.form.vHphm === '') {
                    this.$Message.error('请输入车牌号');
                    return;
                }
                this.car = null;
                this.showFiles = false;
                this.$http.get(this.apis.CAR.QUERY + '?vHphm=' + this.form.vHphm).then((res) => {
                    if (res.code === 200 && res.page && res.page.list && res.page.list.length > 0) {
                        this.car = res.page.list[0];
                        this.getData();
                    } else {
                        this.$Message.error('未找到车辆');
                    }
                })
            },
            getData() {
                this.$http.get(this.apis.FILE.FINDBYPID + '/' + this.car.vId).then((res) => {
                    if (res.code === 200 && res.result) {
                        for (let r of res.result){
                            if (this.files[r.vfDamc]){
                                this.files[r.vfDamc].uploadFile = {};
                                this.files[r.vfDamc].uploadFile.url = r.vfNetPath;
                            }
                        }
                        console.log(this.files);
                        this.showFiles = true;
                    } else {
                        this.$Message.error('未找到文件');
                        this.showFiles = false;
                    }
                })
            },
            handlePrint(o){
                Print({
                    printable: o,
                    type: 'html',
                    // onLoadingStart: () => {
                    //     this.$refs.printDiv.style = "display:block";
                    // },
                    // onLoadingEnd: () => {
                    //     this.$refs.printDiv.style = "display:none";
                    // }
                });
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
                    this.$data[locDataName] = file;
                    console.log(file);
                } else {
                    this.$Message.error("文件上传失败：" + res.message);
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
