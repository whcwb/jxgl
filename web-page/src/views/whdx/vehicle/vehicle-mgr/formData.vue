<style lang="less">
	@import '../../../../styles/common.less';
</style>
<style type="text/css">

</style>
<template>
	<div>
		<Modal v-model="showModal" width='800' :closable='false'
			   :mask-closable="false" :title="operate+'车辆'">
			<div :style="'overflow: auto;height:' + newFlag ? '560px;' : '360px;'">
				<Form
						ref="form"
						:model="formItem"
						:rules="ruleInline"
						:label-width="100"
						:styles="{top: '20px'}">
					<Row>
						<Col span="12">
							<FormItem prop='hphm' label="车牌号">
								<Input v-model="formItem.hphm" placeholder="请填写车牌号" :maxlength="8">
									<Select v-model="hphmPrefix" slot="prepend" style="width: 50px">
										<Option v-for="item in hphmOptions" :value="item">{{item}}</Option>
									</Select>
								</Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem  label="车辆类型">
								<Select filterable  v-model="formItem.vHpzl" placeholder="请选择车辆类型..." @on-change="changeHpzl">
									<Option v-for = '(item,index) in dicts.hpzl.items' :value="item.key">{{item.val}}</Option>
								</Select>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<Col span="12">
							<FormItem  label="注册登记日期">
								<DatePicker :value="formItem.vCcdjrq" type="date" placement="top-start" placeholder="请选择日期" @on-change="(date)=>{formItem.vCcdjrq = date}"></DatePicker>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem  label="使用性质">
								<Select filterable clearable  v-model="formItem.vSyxz" placeholder="请选择车辆使用性质...">
									<Option v-for = '(item,index) in dicts.syxz.items' :value="item.key">{{item.val}}</Option>
								</Select>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<form-items :parent="v"></form-items>
					</Row>
					<Row v-show="newFlag">
						<Col span="12">
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
										:on-success="(res, file,fileList)=>{successCallback(res, file,'xszzmFile')}"
										:format="['jpg','jpeg','png']"
										:max-size="2048"
										:on-format-error="handleFormatError"
										:on-exceeded-size="handleMaxSize"
										type="drag"
										:action="uploadUrl+'?targetPath=xszFile'"
										style="display: inline-block;width:180px;height:180px">
									<div style="width: 180px;height:180px;line-height: 200px;">
										<Icon type="ios-cloud-upload" size="80" style="color: #3399ff"></Icon>
									</div>
								</Upload>
								<h3>扫描行驶证正本</h3>
							</div>
						</Col>
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
    import Cookies from 'js-cookie';
    import formItems from '../../components/formItems'
    export default {
        name: 'vehicleForm',
        components:{formItems},
        data() {
            return {
                v:this,
                operate:'新建',
                newFlag: true,
                showModal: true,
                readonly: false,
				hphmOptions:['京','津','冀','晋','蒙','辽','吉','黑','沪','苏','浙','皖','闽','赣','鲁','豫','鄂','湘','粤','桂','琼','渝','川','贵','云','藏','陕','甘','青','宁','新'],
                hphmPrefix:'鄂',
				formItem: {
                    hphm:'',
                    vId:'',
                    vHphm:'',
                    vHpzl:'20',
                    vCcdjrq:'',
                    vSyxz:'10',
                    vClph:'',
                    vCllx:'',
                    vCjh:'',
                    vFdjh:'',
                    vSyl:'',
                },
                curUser:{},
                uploadUrl:this.apis.url + '/' + this.apis.CAR.SCANFILE,
                //行驶证正面
                xszzmFile:null,
                formInputGroups:[
                    [
                        {label:'车辆品牌',prop:'vClph'},
						{label:'车辆型号',prop:'vCllx'}
					],
                    [
                        {label:'车架号',prop:'vCjh'},
						{label:'发动机号',prop:'vFdjh'}
					],
                    [
                        {label:'所有人',prop:'vSyl'}
					],
                    [
                        {label:'责任人',prop:'vZrr'},
                        {label:'责任人联系电话',prop:'vZrrlxdh'}
                    ],
                ],
                ruleInline:{
                    hphm: [
                        { required: true, message: '请填写车牌号', trigger: 'blur' },
                        { min: 6, max: 10, message: '车牌号长度不正确', trigger: 'blur' },
                    ],
                    vCcdjrq: [
                        { required: true, message: '注册登记日期不能为空', trigger: 'blur' },
                    ]
                },
                dicts:{
                    hpzl:{code:'HPZL',items:[]},
                    syxz:{code:'SYXZ',items:[]}
                }
            }
        },
        created(){
            this.curUser = JSON.parse(Cookies.get('result')).accessToken;
            this.util.initFormModal(this);
            this.util.initDict(this);
            //拆分车牌号码
			if (this.formItem.vHphm){
                this.hphmPrefix = this.formItem.vHphm.substring(0, 1);
                this.formItem.hphm = this.formItem.vHphm.substr(1);

                this.newFlag = false;
			}
        },
        methods: {
            changeHpzl(val){
                //如果是教练车，则固定将车辆使用性质修改为营运机动车
                if (val == "40"){
                    this.formItem.vSyxz = "20";
				}
			},
            //数据提交前，进行业务处理
            beforeSave(){
                this.formItem.vHphm = this.hphmPrefix + this.formItem.hphm;
			},
            //文件上传成功后，回调该方法，进行后续处理
            successCallback (res, file, locDataName) {
                this.$refs.upload.clearFiles();
                if (res.code == 200){
                    this.formItem = res.result;
                    this.formItem.hphm = this.formItem.vHphm.replace(this.hphmPrefix, "");
                }else{
                    this.$Message.error("文件上传失败："+res.message);
                }
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
