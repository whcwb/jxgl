<template>
	<div>
		<Modal
		    v-model="showModal"
			width="800"
		    :closable='false'
		    :mask-closable="false"
		    :title="operate+'用户'">
    		<Form
				ref="addmess"
				:model="addmess"
				:rules="ruleInline"
    			:label-width="120"
    			:styles="{top: '20px'}">
	    		<div :style="isEdit ? 'overflow: auto;height: 480px;' : 'overflow: auto;height: 360px;'">
					<Row>
						<Col span="12">
							<FormItem prop="zh" label='登录名：'>
								<Input :readonly="!usermesType" type="text" v-model="addmess.zh" placeholder="请设置登录帐号">
								</Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem prop="xm" label='姓名：'>
								<Input type="text" v-model="addmess.xm" placeholder="请输入姓名">
								</Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem prop="sjh" label='手机号码：'>
								<Input type="text" v-model="addmess.sjh" placeholder="请输入手机号码">
								</Input>
							</FormItem>
						</Col>
					</Row>
					<Row>
						<Col span="12">
							<FormItem prop="zjhm" label='身份证号码：'>
								<Input type="text" v-model="addmess.zjhm"  placeholder="请输入身份证号码">
								</Input>
							</FormItem>
						</Col>
						<Col span="12">
							<FormItem label='入职日期：'>
								<DatePicker :value="addmess.rzrq" type="date" placement="left" placeholder="请选择日期" @on-change="(date)=>{addmess.rzrq = date}"></DatePicker>
							</FormItem>
						</Col>
					</Row>
					<div v-if="isEdit">
						<Row>
							<Col span="24">
								<FormItem prop="sfzdz" label='居住地址：'>
									<Input type="text" v-model="addmess.sfzdz" ></Input>
								</FormItem>
							</Col>
						</Row>
						<Row>
							<Col span="12">
								<FormItem prop="zjhmexp" label='身份证有效期：'>
									<Input type="text" v-model="addmess.zjhmexp" ></Input>
								</FormItem>
							</Col>
							<Col span="12">
								<FormItem prop="zjcx" label='准驾车型：'>
									<Select filterable clearable  v-model="addmess.zjcx" placement="top">
										<Option v-for="e in zjcxList" :value="e.key" :key="e.key">{{e.val}}</Option>
									</Select>
								</FormItem>
							</Col>
						</Row>
						<Row>
							<Col span="8">
								<FormItem prop="dabh" label='档案编号：'>
									<Input type="text" v-model="addmess.dabh" ></Input>
								</FormItem>
							</Col>
							<Col span="8">
								<FormItem prop="jszclrq" label='登记日期：'>
									<Input type="text" v-model="addmess.jszclrq" ></Input>
								</FormItem>
							</Col>
							<Col span="8">
								<FormItem prop="jszjzrq" label='截止日期：'>
									<Input type="text" v-model="addmess.jszjzrq" ></Input>
								</FormItem>
							</Col>
						</Row>
						<Row>
							<Col span="24">
								<FormItem prop="jszdz" label='驾证地址：'>
									<Input type="text" v-model="addmess.jszdz" ></Input>
								</FormItem>
							</Col>
						</Row>
					</div>
	    		</div>
    		</Form>
		    <div slot='footer'>
		    	<Button type="ghost" @click="colse">取消</Button>
	        	<Button type="primary" @click="AddDataListOk('addmess')">确定</Button>
		    </div>
		</Modal>
	</div>
</template>

<script>


	export default {
		name:'',
		data(){
			return {
				showModal:true,
				operate:"新增",
				isEdit: true,
				//新增数据
                addmess: {
                    zh: '',
                    xm:'',
                    mm:'123456',
                    lx:'30',
                    xb:'1',
                    zw:'',
                    sjh:'',
                    zjhm:'',
					zjcx:'',
                    zjhmexp:'',
					jszclrq:'',
                    jszjzrq:'',
					rzrq:'',
                    jgdm:''
                },
                showPsd:false,
                ruleInline: {
                  	zh: [
                      	{ required: true, message: '请输入用户名', trigger: 'blur' }
                  	],
					mm:[
						{ required: true,message: '请输入登录密码', trigger: 'blur' }
					]
              	},
                yhlxDict:[],
                yhlxDictCode:'ZDCLK0003',
				orgList:[],
                zjcxListCode:'ZJCX',
				zjcxList:[]
			}
		},
		props:{
			usermesType:{
				type:Boolean,
				default:true
			},
			usermes:{
				type:Object,
				default:{}
			}
		},
		watch:{
            addmess:{
                handler(curVal,oldVal){
                    if(!this.usermesType){
                        return;
                    }
                    if (curVal.lx == '10'){
                        this.addmess.xm = '管理员';
					}
                },
                deep:true
			}
		},
		created(){
            if(this.usermesType){
                this.showPsd = true;
            }else{
                this.addmess = JSON.parse(JSON.stringify(this.usermes));
                this.operate = '编辑';
				this.isEdit = true;
			}

            this.zjcxList = this.dictUtil.getByCode(this,this.zjcxListCode);
			//this.getOrgList();
        },
		methods:{
		    getOrgList(){
		        let v = this;
                v.$http.get(this.apis.FRAMEWORK.QUERY,{params:{pageSize:10000}}).then((res) =>{
                    if(res.code===200){
                        this.orgList = res.page.list;
                    }else{
                        v.$Message.error(res.message);
                    }
                }).catch((error) =>{
                    v.$Message.error('出错了！！！');
                })
			},
			colse(){
                var v = this
                v.$parent.compName = ''
            },
		   //确认添加新用户进行前台表单数据验证
            AddDataListOk(name){
            	var v = this
                this.$refs[name].validate((valid) => {
                    if (valid) {
//                    	新增
                    	if(v.usermesType){
                    		v.$http.post(this.apis.USER.ADD,v.addmess).then((res) =>{
								if(res.code===200){
			                    	v.$Message.success('用户注册成功');
									v.$emit('listF',res)
								}else{
                                    v.$Message.error(res.message);
								}
							}).catch((error) =>{
								v.$Message.error('出错了！！！');
							})
                    	}else{
                    	    delete v.addmess.mm;
                    		v.$http.post(this.apis.USER.CHANGE,v.addmess).then((res) =>{
								if(res.code===200){
									v.$Message.success('用户修改成功');
									v.$emit('listF',res)
								}else{
                                    v.$Message.error(res.message);
								}
							}).catch((error) =>{
								v.$Message.error('出错了！！！');
							})
                    	}
                    } else {
                        v.$Message.error('请认真填写用户信息!');
                    }
                })
            },
		}
	}
//15271928827
</script>

<style>
</style>
