<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" title="档案上传">
			<div style="overflow: auto;height: 500px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<Col span="12">
							<Card>
								<p slot="title">
									[{{formItem.vHphm}}]商业险
								</p>
								<FormItem label='保单编号'>
									<Input type="text" :value="formItem.inBdh" disabled></Input>
								</FormItem>
								<FormItem label='承保公司'>
									<Input type="text" :value="formItem.inBxgs" disabled></Input>
								</FormItem>
								<FormItem label='保险有效期'>
									<Input type="text" :value="formItem.inQbrq+'至'+formItem.inZbrq" disabled></Input>
								</FormItem>
								<FormItem label='保险金额'>
									<Input type="text" :value="formItem.inBxje" disabled></Input>
								</FormItem>
							</Card>
						</Col>
						<Col span="12">
							<Card>
								<p slot="title">
									[{{formItem.vHphm}}]交强险
								</p>
								<FormItem label='保单编号'>
									<Input type="text" :value="formItem.inJqbdh" disabled></Input>
								</FormItem>
								<FormItem label='承保公司'>
									<Input type="text" :value="formItem.inJqbxgs" disabled></Input>
								</FormItem>
								<FormItem label='保险有效期'>
									<Input type="text" :value="formItem.inJqqbrq+'至'+formItem.inJqzbrq" disabled></Input>
								</FormItem>
								<FormItem label='保险金额'>
									<Input type="text" :value="formItem.inJqbxje" disabled></Input>
								</FormItem>
							</Card>
						</Col>
					</Row>
					<Row>
						<Col span="24">
							<Card>
								<p slot="title">
									[{{formItem.vHphm}}]保险档案文件
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
												:action="uploadUrl+'/'+formItem.inId+'/30/insuranceFile?targetPath=insuranceFile&batch=true'"
												style="display: inline-block;width:58px;">
											<div style="width:58px;height:58px;line-height: 58px;">
												<Icon type="camera"></Icon>
											</div>
										</Upload>
									</Col>
								</Row>
							</Card>
						</Col>
					</Row>
				</Form>
			</div>
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
    import Cookies from 'js-cookie';
	export default {
		name: 'insuranceForm',
		data() {
			return {
			    v:this,
				showModal: true,
				readonly: false,
				formItem: {
			        inXz:[],
				},
                formInputs:[
                    {label:'商业险保单编号',prop:'inBdh', required:true},
                    {label:'商业险保险公司',prop:'inBxgs', type:'dict', dict:'bxgsxx'},
                    {label:'商业险起保时间',prop:'inQbrq', type:'date'},
                    {label:'交强险保单号',prop:'inJqbdh'},
                    {label:'交强险保险公司',prop:'inJqbxgs', type:'dict', dict:'bxgsxx'},
                    {label:'交强险起保时间',prop:'inJqqbrq', type:'date', placement:"top-start"},
                ],
                ruleInline:{
                    vHphm: [
                        { required: true, message: '请填写车牌号', trigger: 'blur' },
                    ],
				},
                dicts:{
                    bxsyxz:{code:'BXSYXZ',items:[]},
                    bxgsxx:{code:'BXGSXX',items:[]}
                },
				//图片上传属性
                curUser:{},
                visible:false,
                uploadUrl:this.apis.FILE.UPLOAD,
                imgUrl: '',
                defaultList: [],
                imgName: '',
                uploadList: []
			}
		},
		created(){
		    this.util.initFormModal(this);
            this.util.initDict(this);
		},
        mounted(){
			this.curUser = JSON.parse(Cookies.get('result')).accessToken;
			this.loadPhoto();
        },
		methods: {
            //加载已经上传的档案
            loadPhoto(){
                this.$http.get(this.apis.FILE.FINDBYPID + "/" + this.formItem.inId + "/insuranceFile").then((res) =>{
                    if (res.code == 200 && res.result){
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
		width: 120px;
		height: 100px;
		text-align: center;
		line-height: 100px;
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
		margin: 0 8px;
	}
</style>
