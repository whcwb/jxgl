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
						<FormItem prop="vHphm" label='车牌号'>
							<Select
									ref="remoteHphm"
									v-model="formItem.vHphm"
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
                visible:false,
				formItem: {
			        inXz:[],
				},
                formInputs:[
                    {label:'保单编号',prop:'inBdh', required:true},
                    {label:'商业险保险公司',prop:'inBxgs'},
                    {label:'商业险起保时间',prop:'inQbrq', type:'date'},
                    {label:'商业险保险金额',prop:'inBxje'},
                    {label:'商业险险种',prop:'inXz', span:24},
                    {label:'交强险保单号',prop:'inJqbdh'},
                    {label:'交强险保险公司',prop:'inJqbxgs'},
                    {label:'交强险起保时间',prop:'inJqqbrq', type:'date', placement:"top-start"},
                    {label:'交强险保险金额',prop:'inJqbxje'},
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
			}
		},
		created(){
		    this.util.initFormModal(this);
            this.util.initDict(this);
		},
        mounted(){
            this.loadDetail();

        },
		methods: {
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
