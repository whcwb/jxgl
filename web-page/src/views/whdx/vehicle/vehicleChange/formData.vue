<style type="text/css">
</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
        			:mask-closable="false" :title="operate+''">
        	<div style="overflow: auto;height: 500px;">
        		<Form ref="form"
        			:model="formItem"
        		    :rules="ruleInline"
        			:label-width="100"
        			:styles="{top: '20px'}">
        		    <Row>
        				<form-items :parent="v"></form-items>
        			</Row>

					<Row v-if="showFiles" style="padding-bottom: 15px">
						<Card dis-hover>
							<Row>
								<Col v-for="(item,key) in  files" span="6" :key="key">
									<div style="text-align:center;margin-top: 16px">
										<div class="demo-upload-list" v-if="item.uploadFile != null">
											<template v-if="item.uploadFile.status === 'finished'">
												<img :src="staticPath + item.uploadFile.url">
												<div class="demo-upload-list-cover">
													<Icon type="ios-printer-outline" size="32" :id="'img_'+key"
														  @click.native="handlePrint('img_'+key)"></Icon>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<Icon type="ios-eye-outline" size="32"
														  @click.native="handleView(staticPath  + item.uploadFile.url)"></Icon>
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
												:max-size="2048"
												:on-format-error="handleFormatError"
												:on-exceeded-size="handleMaxSize"
												type="drag"
												:action="uplaodUrl+'/'+formItem.vId+'/20/'+key+'?targetPath='+key"
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
        		</Form>
        	</div>
        	<div slot='footer'>
        		<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
        		<Button type="primary" @click="v.util.save(v)">确定</Button>
        	</div>
        </Modal>
	</div>
</template>

<script>
	import formItems from '../../components/formItems'
    import Cookies from 'js-cookie';
	export default {
		name: 'vehicleChangeForm',
		components:{formItems},
		data() {
			return {
			    v:this,
                operate:'产权变更',
				showModal: true,
				readonly: true,
                showFiles: true,
				saveUrl:this.apis.vehicleChange.ADD,
                staticPath: this.apis.STATIC_PATH,
				formItem:{
                    chgOzrr:'',
                    chgOzrrlxdh:'',
                    chgOjz:'',
				},
                formInputs:[
                    {label:'车辆',prop:'vId',type:'foreignKey',disabled:true},
                    {label:'变更前责任人',prop:'chgOzrr',disabled:true},
                    {label:'变更前联系电话',prop:'chgOzrrlxdh',disabled:true},
                    {label:'变更前价值',prop:'chgOjz',disabled:true},
                    {label:'变更后责任人',prop:'chgNzrr'},
                    {label:'变更后联系电话',prop:'chgNzrrlxdh'},
                    {label:'变更后价值',prop:'chgNjz'},
                ],
                uplaodUrl: this.apis.FILE.UPLOAD,
                files: {
                    sfzFile: {title: '身份证', uploadFile: null},
                    hkFile: {title: '户口', uploadFile: null},
                    claqxyFile: {title: '车辆安全协议', uploadFile: null},
                },
                curUser: '',
                ruleInline:{
				},
                foreignList:{
                    vId:{url:this.apis.CAR.QUERY,key:'vId',val:'vHphm',items:[]},
                },
				car:''
			}
		},
		created(){
		    this.car = this.$parent.choosedItem;
		    this.formItem.chgOzrr = this.car.vZrr;
		    this.formItem.chgOzrrlxdh = this.car.vZrrlxdh;
		    this.formItem.chgOjz = this.car.vWorth;
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
            this.util.initFormRule(this);
            this.util.initForeignKeys(this);
            this.util.initDict(this);
            this.formItem.vId = this.$parent.choosedItem.vId;
        },
		methods: {
            handlePrint(o) {
                Print({
                    printable: 'img_'+o,
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
                    this.files[locDataName].uploadFile = file;
                    // this.$data[locDataName] = file;
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

<style>

</style>
