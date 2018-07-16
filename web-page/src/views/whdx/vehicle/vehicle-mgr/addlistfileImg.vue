<template>
	<div>
		<Modal
				v-model="showModal"
				height="460"
				width="1200"
				:closable='false'
				:mask-closable="false"
				title="证件照片">
			<Form :model="formItem" :label-width="80">
			<Row>
				<Col span="6">
					<FormItem label='车牌号：'>
						<Input type="text" v-model="formItem.vHphm"  disabled ></Input>
					</FormItem>
				</Col>
				<Col span="6">
					<FormItem label='车辆类型：'>
						<Input type="text" v-model="hpzlVal" disabled></Input>
					</FormItem>
				</Col>
				<Col span="6">
					<FormItem label='注登日期：'>
						<Input type="text" v-model="formItem.vCcdjrq" disabled></Input>
					</FormItem>
				</Col>
				<Col span="6">
					<FormItem label='所有人：'>
						<Input type="text" v-model="formItem.vSyl" disabled></Input>
					</FormItem>
				</Col>
			</Row>
			</Form>
			<Row style="padding-bottom: 15px">
				<Card dis-hover>
					<Row>
						<Col span="6">
							<div style="text-align:center">
								<div class="demo-upload-list" v-if="xszzmFile != null">
									<template v-if="xszzmFile.status === 'finished'">
										<img :src="xszzmFile.url">
										<div class="demo-upload-list-cover">
											<Icon type="ios-eye-outline" size="32" @click.native="handleView(xszzmFile.url)"></Icon>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<Icon type="refresh" size="32" @click.native="handleRemove(xszzmFile)"></Icon>
										</div>
									</template>
									<template v-else>
										<Progress v-if="xszzmFile.showProgress" :percent="xszzmFile.percentage" hide-info></Progress>
									</template>
								</div>

								<Upload
										v-show="xszzmFile == null"
										ref="upload"
										:headers="{'userid':curUser.userId, 'token':curUser.token}"
										:show-upload-list="false"
										:on-success="(res, file,fileList)=>{successCallback(res, file,'xszzmFile')}"
										:on-error="errorCallback"
										:format="['jpg','jpeg','png']"
										:max-size="8192"
										:on-format-error="handleFormatError"
										:on-exceeded-size="handleMaxSize"
										type="drag"
										:action="uploadUrl+'/'+formItem.vId+'/20/xszzmFile?targetPath=xszFile'"
										style="display: inline-block;width:180px;height:180px">
									<div style="width: 180px;height:180px;line-height: 200px;">
										<Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
									</div>
								</Upload>
								<h3>行驶证正本</h3>
							</div>
						</Col>
						<Col span="6">
							<div style="text-align:center">
								<div class="demo-upload-list" v-if="xszfmFile != null">
									<template v-if="xszfmFile.status === 'finished'">
										<img :src="xszfmFile.url">
										<div class="demo-upload-list-cover">
											<Icon type="ios-eye-outline" size="32" @click.native="handleView(xszfmFile.url)"></Icon>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<Icon type="refresh" size="32" @click.native="handleRemove(xszfmFile)"></Icon>
										</div>
									</template>
									<template v-else>
										<Progress v-if="xszfmFile.showProgress" :percent="xszfmFile.percentage" hide-info></Progress>
									</template>
								</div>

								<Upload
										v-show="xszfmFile == null"
										ref="upload"
										:headers="{'userid':curUser.userId, 'token':curUser.token}"
										:show-upload-list="false"
										:on-success="(res, file,fileList)=>{successCallback(res, file,'xszfmFile')}"
										:on-error="errorCallback"
										:format="['jpg','jpeg','png']"
										:max-size="8192"
										:on-format-error="handleFormatError"
										:on-exceeded-size="handleMaxSize"
										type="drag"
										:action="uploadUrl+'/'+formItem.vId+'/20/xszfmFile?targetPath=xszFile'"
										style="display: inline-block;width:180px;height:180px">
									<div style="width: 180px;height:180px;line-height: 200px;">
										<Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
									</div>
								</Upload>
								<h3>行驶证副本</h3>
							</div>
						</Col>
						<Col span="6">
							<div style="text-align:center">
								<div class="demo-upload-list" v-if="cqdjzFile != null">
									<template v-if="cqdjzFile.status === 'finished'">
										<img :src="cqdjzFile.url">
										<div class="demo-upload-list-cover">
											<Icon type="ios-eye-outline" size="32" @click.native="handleView(cqdjzFile.url)"></Icon>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<Icon type="refresh" size="32" @click.native="handleRemove(cqdjzFile)"></Icon>
										</div>
									</template>
									<template v-else>
										<Progress v-if="cqdjzFile.showProgress" :percent="cqdjzFile.percentage" hide-info></Progress>
									</template>
								</div>

								<Upload
										v-show="cqdjzFile == null"
										ref="upload"
										:headers="{'userid':curUser.userId, 'token':curUser.token}"
										:show-upload-list="false"
										:on-success="(res, file,fileList)=>{successCallback(res, file,'cqdjzFile')}"
										:on-error="errorCallback"
										:format="['jpg','jpeg','png']"
										:max-size="8192"
										:on-format-error="handleFormatError"
										:on-exceeded-size="handleMaxSize"
										type="drag"
										:action="uploadUrl+'/'+formItem.vId+'/20/cqdjzFile?targetPath=cqzFile'"
										style="display: inline-block;width:180px;height:180px">
									<div style="width: 180px;height:180px;line-height: 200px;">
										<Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
									</div>
								</Upload>
								<h3>产权登记证书</h3>
							</div>
						</Col>
						<Col span="6">
							<div style="text-align:center">
								<div class="demo-upload-list" v-if="yyzFile != null">
									<template v-if="yyzFile.status === 'finished'">
										<img :src="yyzFile.url">
										<div class="demo-upload-list-cover">
											<Icon type="ios-eye-outline" size="32" @click.native="handleView(yyzFile.url)"></Icon>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<Icon type="refresh" size="32" @click.native="handleRemove(yyzFile)"></Icon>
										</div>
									</template>
									<template v-else>
										<Progress v-if="yyzFile.showProgress" :percent="yyzFile.percentage" hide-info></Progress>
									</template>
								</div>

								<Upload
										v-show="yyzFile == null"
										ref="upload"
										:headers="{'userid':curUser.userId, 'token':curUser.token}"
										:show-upload-list="false"
										:on-success="(res, file,fileList)=>{successCallback(res, file,'yyzFile')}"
										:on-error="errorCallback"
										:format="['jpg','jpeg','png']"
										:max-size="8192"
										:on-format-error="handleFormatError"
										:on-exceeded-size="handleMaxSize"
										type="drag"
										:action="uploadUrl+'/'+formItem.vId+'/20/yyzFile?targetPath=yunyzFile'"
										style="display: inline-block;width:180px;height:180px">
									<div style="width: 180px;height:180px;line-height: 200px;">
										<Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
									</div>
								</Upload>
								<h3>营运证</h3>
							</div>
						</Col>
					</Row>
				</Card>
			</Row>
			<div slot='footer'>
				<Button type="ghost" @click="colse">取消</Button>
			</div>
		</Modal>

		<Modal title="图片预览" v-model="visible" >
			<img :src="imgUrl" v-if="visible" style="width: 100%">
			<div slot="footer"></div>
		</Modal>
	</div>
</template>
<script>
    import Cookies from 'js-cookie';
    export default {
    	name:'',
        data () {
            return {
				curUser:{},
                visible:false,
                showModal:true,
                defaultList: [],
                imgUrl: '',
                formItem: {},
                visible: false,
                uploadList: [],
                hpzlVal:'',
				uploadUrl:this.apis.FILE.UPLOAD,
				//行驶证正面
				xszzmFile:null,
				//行驶证副面
                xszfmFile:null,
				//机动车产权登记证书
                cqdjzFile:null,
				//营运证
                yyzFile:null,
                dicts:{
					hpzl:{code:'HPZL',items:[]}
				}
            }
        },
        created(){
            this.util.initFormModal(this);
            this.util.initDict(this);
        },
        methods: {
            //加载文件列表
            loadFiles(){
                this.curUser = JSON.parse(Cookies.get('result')).accessToken;
                this.$http.get(this.apis.FILE.FINDBYPID + "/" + this.formItem.vId).then((res) =>{
                    if (res.code == 200){
						for (let item of res.result){
							 this.$data[item.vfDamc] = {
								 name:item.vfDamc,
								 status:'finished',
								 url:this.apis.STATIC_PATH + item.vfNetPath + '?d='+new Date().getTime()
							 };
						 }
                    }
                })
			},
            colse(){
                var v = this
                v.$parent.componentName = '';
                v.$parent.choosedItem = null;
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
        },
        mounted () {
            //翻译字典类型
            this.hpzlVal = $.map(this.dicts.hpzl.items, item => {
                if(item.key == this.formItem.vHpzl) {
                    return item.val;
                }
            });
            this.loadFiles();
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