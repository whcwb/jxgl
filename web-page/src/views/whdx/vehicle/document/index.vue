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
					<Button type="primary" @click="getData">
						<Icon type="search"></Icon>
					</Button>
				</Col>
			</Row>
		</Form>
		<Row style="padding-bottom: 15px">
			<Card dis-hover>
				<Row>
					<Col v-for="(item,index) in  files" span="6" :key="index">
						<div style="text-align:center;margin-top: 16px">
							<div class="demo-upload-list" v-if="item.uploadFile != null">
								<template v-if="item.uploadFile.status === 'finished'">
									<img :src="item.uploadFile.url">
									<div class="demo-upload-list-cover">
										<Icon type="ios-eye-outline" size="32" @click.native="handleView(item.uploadFile.url)"></Icon>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<Icon type="refresh" size="32" @click.native="handleRemove(item.uploadFile)"></Icon>
									</div>
								</template>
								<template v-else>
									<Progress v-if="item.uploadFile.showProgress" :percent="item.uploadFile.percentage" hide-info></Progress>
								</template>
							</div>
							<Upload
									v-show="item.uploadFile == null"
									ref="upload"
									:headers="{'userid':curUser.userId, 'token':curUser.token}"
									:show-upload-list="false"
									:on-success="(res, file,fileList)=>{successCallback(res, file,'xszzmFile')}"
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
		</Row>
		<component :is="componentName"></component>
	</div>
</template>

<script>
    import Cookies from 'js-cookie';
    import swal from 'sweetalert2'
    export default {
        name: 'wfxx',
        data() {
            return {
                v:this,
                componentName:'',
                SpinShow: true,
                form: {
                    vHphm:''
                },
				files:[
					{title:'行车证',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'登记证书',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'保单',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'驾驶证',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'车辆异动',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'内部车辆产权登记',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'车辆安全协议',uploadFile:null,action:'',showProgress:true,percentage:true},
					{title:'告知表',uploadFile:null,action:'',showProgress:true,percentage:true},
				],
                curUser:'',
				car:'',
            }
        },
        created() {
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
        },
        methods: {
            getData(){
                if (this.form.vHphm === ''){
                    this.$Message.error('请输入车牌号');
                    return;
				}
                this.car = null;
                this.$http.get(this.apis.CAR.QUERY,{params:this.form}).then((res)=>{
                    console.log(res.list);
                    if (res.code === 200 && res.page && res.page.list && res.page.list.length > 0) {
                        this.car = res.page.list[0];
					}else{
                        this.$Message.error('未找到车辆');
					}
				})
			},
            handleView (url) {
                this.imgUrl = url;
                this.visible = true;
            },
            //文件上传成功后，回调该方法，进行后续处理
            successCallback (res, file, locDataName) {
                if (res.code == 200){
                    //拼接文件全路径url
                    file.url = this.apis.STATIC_PATH + res.message;
                    //重新给name赋值，以便预览图片和删除文件时使用
                    file.name = locDataName;
                    //将文件对象和data的属性进行绑定
                    this.$data[locDataName] = file;
                    console.log(file);
                }else{
                    this.$Message.error("文件上传失败："+res.message);
                }
            },
            //文件上传成功后，回调该方法，进行后续处理
            errorCallback (res, file, locDataName) {
                this.$Message.error("文件上传失败，请稍后重试！");
            },
            handleRemove (file) {
                this.$data[file.name] = null;
            },
            handleFormatError (file) {
                this.$Notice.warning({
                    title: '文件格式错误',
                    desc: '图片仅支持 jpg、jpeg、png'
                });
            },
            handleMaxSize (file) {
                this.$Notice.warning({
                    title: '文件太大了',
                    desc: '文件不能超过18M'
                });
            }
        }
    }
</script>
