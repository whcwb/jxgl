<template>
	<div>
		<Modal
				v-model="showModal"
				height="660"
				width="760"
				:closable='false'
				:mask-closable="false"
				title="审验打印">
			<div id="printImgDiv">
				<Row>
					<Col span="24">
						<img v-if="sfzzmFile != null" :src="sfzzmFile.url" width="336">
						<img v-if="sfzfmFile != null" :src="sfzfmFile.url" width="336">
					</Col>
				</Row>
				<Row>
					<Col span="24">
						<img v-if="jszzmFile != null" :src="jszzmFile.url" width="680">
					</Col>
				</Row>
				<Row>
					<Col span="24">
						<img v-if="jlzzmFile != null" :src="jlzzmFile.url" width="336">
					</Col>
				</Row>
			</div>

			<div slot='footer'>
				<Button type="ghost" @click="colse">取消</Button>
				<Button type="primary" @click="printImg">打印</Button>
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
    import swal from 'sweetalert2'
    import Print from 'print-js'
    export default {
    	name:'',
        data () {
            return {
				curUser:{},
                visible:false,
                showModal:true,
                defaultList: [],
                imgUrl: '',
                visible: false,
                uploadList: [],
				uploadUrl:this.apis.FILE.UPLOAD,
				//身份证正面
				sfzzmFile:null,
				//身份证反面
                sfzfmFile:null,
				//驾驶证正本
                jszzmFile:null,
                //驾驶证副本
                jszfmFile:null,
                //教练证
                jlzzmFile:null,
            }
        },
        props:{
            usermes:{
                type:Object,
                default:{}
            },
			urlList:{
				type:String,
				default:''
			}
		},
        created(){
            let v = this;
            v.$http.get(v.apis.FILE.FINDBYPID + '/' + this.usermes.yhid).then((res) =>{
                if (res.code === 200 && res.result != null && res.result.length > 0){
                    for (let item of res.result){
                        this.$data[item.vfDamc] = {
                            name:item.vfDamc,
                            status:'finished',
                            vfId:item.vfId,
                            url:this.apis.STATIC_PATH + item.vfNetPath + '?d='+new Date().getTime()
                        };
                    }
                }else{
                    swal({
                        text: "请先上传证件！",
                        type: "error"
                    })
                }
            }, (error)=>{
                swal.close();

                swal({
                    text: '网络异常',
                    type: 'error'
                })
            })
        },
        methods: {
            colse(){
                var v = this
                v.$parent.compName = '';
                v.$parent.getmess();
            },
            printImg () {
                setTimeout(()=>{
                    Print({
                        printable: 'printImgDiv',
                        type: 'html'
                    });
                }, 100);
            }
        },
        mounted () {

        }
    }
</script>