<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			   :mask-closable="false" title="分配人员">
			<div style="overflow: auto;height: 300px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<Col span="24">
							<FormItem label="使用人">
								<Select
										ref="remoteSyr"
										v-model="formItem.vLxr"
										filterable
										clearable
										remote
										label-in-value
										:label="lxrLabel"
										:remote-method="remoteQueryUser"
										:loading="remoteLoading">
									<Option v-for="(option, index) in remoteOptions" :value="option.yhid+'-'+option.xm" :key="option.yhid">{{option.xm}}</Option>
								</Select>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<Col span="24">
							<div class="demo-upload-list" v-for="item in uploadList">
								<template v-if="item.status === 'finished'">
									<img :src="item.url">
									<div class="demo-upload-list-cover">
										<Icon type="ios-eye-outline" @click.native="handleView(item.url)"></Icon>
										<Icon type="ios-trash-outline" @click.native="handleRemove(item)"></Icon>
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
									:max-size="2048"
									:on-format-error="handleFormatError"
									:on-exceeded-size="handleMaxSize"
									multiple
									type="drag"
									:action="uploadUrl+'/'+formItem.vId+'/20/vehOtherFile?targetPath=vehOtherFile&batch=true'"
									style="display: inline-block;width:58px;">
								<div style="width: 58px;height:58px;line-height: 58px;">
									<Icon type="camera" size="20"></Icon>
								</div>
							</Upload>
						</Col>
					</Row>
				</Form>
			</div>
			<div slot='footer'>
				<Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
				<Button type="primary" @click="v.util.save(v)">确定</Button>
			</div>
		</Modal>

		<Modal title="图片预览" v-model="visible">
			<img :src="imgUrl" v-if="visible" style="width: 100%">
			<div slot="footer"></div>
		</Modal>
	</div>
</template>

<script>
    import Cookies from 'js-cookie';
    export default {
        name: 'vehicleForm',
        data() {
            return {
                v:this,
                curUser:{},
                saveUrl:this.apis.CAR.ALLOCPERSON,
                visible:false,
                uploadUrl:this.apis.FILE.UPLOAD,
                imgUrl: '',
                remoteLoading: false,
				remoteOptions:[],
                showModal: true,
                readonly: false,
				lxrLabel:'',
				formItem: {
                    vId:'',
                    vLxr:'',
                    vLxdh:''
                },
                ruleInline:{},
                defaultList: [],
                imgName: '',
                uploadList: []
            }
        },
        created(){
            this.util.initFormModal(this);
        },
		mounted(){
            if (this.formItem.vLxr){
                this.lxrLabel = this.formItem.vLxr.split("-")[1];
            }
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;

            this.loadPhoto();
		},
        methods: {
		    loadPhoto(){
                this.$http.get(this.apis.FILE.FINDBYPID + "/" + this.formItem.vId + "/vehOtherFile").then((res) =>{
                    if (res.code == 200){
                        for (let item of res.result){
                            this.uploadList.push({
                                name:item.vfDamc,
                                status:'finished',
                                url:this.apis.STATIC_PATH + item.vfNetPath
                            });
                        }
                    }
                })

                this.uploadList = this.$refs.upload.fileList;
			},
            remoteQueryUser (query) {
                if (query !== '') {
                    this.remoteLoading = true;
                    this.$http.post(this.apis.USER.SEARCHSOME, {xmLike:query}).then((res) =>{
                        if(res.code===200){
                            this.remoteOptions = res.result;
                        }else{
                            this.$Message.error(res.message);
                        }
                    }).catch((error) =>{
                        log(error)
                    }).then(()=>{
                        this.remoteLoading = false;
					})
                } else {
                    this.remoteOptions = [];
                }
            },
            handleView (url) {
                this.imgUrl = url;
                this.visible = true;
            },
            //文件上传成功后，回调该方法，进行后续处理
            handleSuccess (res, file, fileList) {
                if (res.code == 200){
                    //拼接文件全路径url
                    file.url = this.apis.STATIC_PATH + res.message;
                }else{
                    this.$Message.error("文件上传失败："+res.message);
                }
            },
            handleRemove (file) {
                const fileList = this.$refs.upload.fileList;
                this.$refs.upload.fileList.splice(fileList.indexOf(file), 1);
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

<style scoped>
	.demo-upload-list{
		display: inline-block;
		width: 60px;
		height: 60px;
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
		display: block;
	}
	.demo-upload-list-cover i{
		color: #fff;
		font-size: 20px;
		cursor: pointer;
		margin: 0 2px;
	}
</style>
