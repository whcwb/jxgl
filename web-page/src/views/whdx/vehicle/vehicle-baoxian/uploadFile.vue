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
						<Col span="24">
						<FormItem label='车牌号'>
							<Input type="text" :value="hphmLabel" ></Input>
						</FormItem>
						</Col>
					</Row>
					<Row>
						<Col v-for="i in formInputs" :span="i.span ? i.span : 12">
							<FormItem :prop='i.prop' :label='i.label'>
								<Select v-if="i.type == 'dict-multiple'" multiple filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in dicts[i.dict].items' :value="item.key" :key="item.val">{{item.val}}</Option>
								</Select>
								<Select v-else-if="i.type == 'dict'" filterable clearable  v-model="formItem[i.prop]" :placeholder="'请选择'+i.label+'...'">
									<Option v-for = '(item,index) in dicts[i.dict].items' :value="item.key+'-'+item.val">{{item.val}}</Option>
								</Select>
								<DatePicker v-else-if="i.type == 'date'" :placement="i.placement" :value="formItem[i.prop]" type="date" placeholder="请选择日期" @on-change="(date)=>{formItem[i.prop] = date}"></DatePicker>
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
								:action="uploadUrl+'/'+formItem.vId+'/30/insuranceFile?targetPath=insuranceFile&batch=true'"
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
		name: 'insuranceForm',
		data() {
			return {
			    v:this,
                remoteLoading: false,
                remoteOptions:[],
                operate:'新建',
                hphmLabel:'',
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
            this.loadDetail();

            if (this.$parent.chooseItem){
                this.curUser = JSON.parse(Cookies.get('result')).accessToken;
                this.loadPhoto();
			}
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
            //查看已存在的信息详情。修改时加载显示
            loadDetail(){
                if (this.formItem.vHphm){
                    this.hphmLabel = this.formItem.vHphm;
                    this.formItem.vHphm = this.formItem.vId;
                }
                if (this.formItem.inBxgs){
                    this.formItem.inBxgs = this.formItem.inBxdh + "-" + this.formItem.inBxgs;
                }
                if (this.formItem.inJqbxgs){
                    this.formItem.inJqbxgs = this.formItem.inJqbxdh + "-" + this.formItem.inJqbxgs;
                }
                if (this.formItem.inXz){
                    this.formItem.inXz = this.formItem.inXz.split(",");
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

<style>

</style>
