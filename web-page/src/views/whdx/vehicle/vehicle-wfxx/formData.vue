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
			}
		},
		created(){
		    this.util.initFormModal(this);
		},
        mounted(){
            this.loadDetail();
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
		}
	}
</script>

<style>

</style>
