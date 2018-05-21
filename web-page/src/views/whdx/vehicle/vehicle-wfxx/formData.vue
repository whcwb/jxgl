<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='900' :closable='false'
			:mask-closable="false" :title="operate+''">
			<div style="overflow: auto;height: 500px;">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<Col span="24">
							<FormItem prop="vId" label='车牌号'>
								<Select
										ref="remoteHphm"
										v-model="formItem.vId"
										filterable
										clearable
										remote
										label-in-value
										:label="hphmLabel"
										:remote-method="remoteQuery"
										:loading="remoteLoading">
									<Option v-for="(option, index) in remoteOptions" :value="option.vId" :key="option.vId">{{option.vHphm}}</Option>
								</Select>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<Col v-for="i in formInputs" :span="i.span ? i.span : 12">
							<FormItem :prop='i.prop' :label='i.label'>
								<DatePicker v-if="i.type == 'datetime'" :placement="i.placement" :value="formItem[i.prop]" type="datetime" placeholder="请选择日期" @on-change="(date)=>{formItem[i.prop] = date}"></DatePicker>
								<Select v-else-if="i.type == 'dict'" filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in v.dictUtil.getByCode(v,i.dict)' :value="item.key">{{item.val}}</Option>
								</Select>
								<Input v-else type="text" v-model="formItem[i.prop]" :placeholder="'请填写'+i.label+'...'"></Input>
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
									:show-upload-list="false"
									:default-file-list="defaultList"
									:on-success="handleSuccess"
									:format="['jpg','jpeg','png']"
									:max-size="2048"
									:on-format-error="handleFormatError"
									:on-exceeded-size="handleMaxSize"
									multiple
									type="drag"
									:action="uploadUrl+'?targetPath=wfxxFile'"
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
	export default {
		name: 'wfxxForm',
		data() {
			return {
			    v:this,
                operate:'新建',
				showModal: true,
				readonly: false,
				formItem: {
                    wfWfzt:'01',
                    wfWfjf:0
				},
                formInputs:[
                    {label:'违法编号',prop:'wfId', required:true},
                    {label:'违法时间',prop:'wfWfsj', type:'datetime', placement:"top-start"},
                    {label:'违法地点',prop:'wfWfdz', span:'24'},
                    {label:'违法行为',prop:'wfWfxw', required:true},
                    {label:'违法记分',prop:'wfWfjf'},
                    {label:'违法金额',prop:'wfWfje'},
                    {label:'违法状态',prop:'wfWfzt', type:'dict',dict:'WFZT'},
                ],
                ruleInline:{
                    vId: [
                        { required: true, message: '请填写车牌号', trigger: 'blur' },
                    ],
				},
				//车牌号远程加载
                remoteLoading: false,
                remoteOptions:[],
                hphmLabel:'',
				//文件上传
                visible:false,
                uploadUrl:this.apis.UPLOAD,
                defaultList: [],
                imgName: '',
                uploadList: []
			}
		},
		created(){
		    this.util.initFormModal(this);
		},
        mounted(){
            this.loadDetail();

            this.loadPhoto();
        },
		methods: {
            //查看已存在的信息详情。修改时加载显示
            loadDetail(){
                if (this.formItem.vHphm){
                    this.hphmLabel = this.formItem.vHphm;
                }
            },
            remoteQuery (query) {
                if (query !== '') {
                    this.remoteLoading = true;
                    this.$http.post(this.apis.CAR.SEARCHSOME, {vHphmLike:query}).then((res) =>{
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
			//上传文件相关方法
            loadPhoto(){
                if (this.$parent.choosedItem){
                    this.$http.get(this.apis.FILE.FINDBYPID + "/" + this.formItem.wfId).then((res) =>{
                        if (res.code == 200){
                            for (let item of res.result){
                                this.uploadList.push({
                                    name:item.vfDamc,
                                    response:{
                                        code:200,
										message:item.vfNetPath
									},
                                    status:'finished',
                                    url:this.apis.STATIC_PATH + item.vfNetPath
                                });
                            }
                        }
                    })
				}

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
            },
			beforeSave(){
                let photos = $.map(this.uploadList, item=>{
                    if (item.response.code == 200){
                        return item.response.message;
					}
				});

                this.formItem.photos = photos.join(',');
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

