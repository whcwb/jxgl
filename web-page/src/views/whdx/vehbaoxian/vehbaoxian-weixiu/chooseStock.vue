<template>
    <Modal v-model="showModal" width='900' :closable='false'
           :mask-closable="false" title="选择商品" style="z-index: 10000000000">
        <div style="overflow: auto;height: 500px;">
            <Form
                    ref="form"
                    :model="formItem"
                    :rules="ruleInline"
                    :label-width="100"
                    :styles="{top: '20px'}">
                <Row v-for="(r,i) in this.choosedList">
                    <Col span="8">
                        <FormItem prop='productName' label='商品名称'>
                            <Select v-model="r.productName" @on-change="(e)=>change(e,r)">
                                <Option v-for="(item,index) in productList" :key="index" :value="item.productName">{{item.productName}}</Option>
                            </Select>
                        </FormItem>
                    </Col>
                    <Col span="6">
                        <FormItem prop='number' label='商品数量'>
                            <InputNumber v-model="r.number"></InputNumber>
                        </FormItem>
                    </Col>
                    <Col span="4">
                        <label>剩余：{{r.rest}} 个</label>
                    </Col>
                    <Col span="4">
                        <!--<Button v-if="!r.confirm" type="primary" @click="submit(r)">确定</Button>-->
                        <Button type="default" @click="del(i)">删除</Button>
                    </Col>
                </Row>
                <Row>
                    <Col span="12">
                        <FormItem prop='number' label=''>
                            <Button type="primary" @click="add">添加</Button>
                        </FormItem>
                    </Col>
                </Row>
            </Form>
        </div>
        <div slot='footer'>
            <Button type="primary" @click="close">完成</Button>
        </div>
    </Modal>
</template>

<script>
    export default {
        name: "chooseStock",
        data(){
            return{
                v:this,
                showModal:true,
                saveUrl:this.apis.stock.outStock,
                formItem:{
                    number:1,
                },
                ruleInline:{

                },
                productList:[],
                rest:0,
                choosedList:[]
            }
        },
        created(){
        },
        mounted(){
            this.showModal = true;
            this.getProducts();
        },
        methods:{
            getProducts(){
                this.productList = [];
                this.$http.get(this.apis.stock.QUERY,{params:{pageSize:100}}).then((res)=>{
                    if (res.code === 200){
                        this.productList = res.page.list;
                        if (this.productList.length > 0){
                            let c = this.productList[0];
                            this.choosedList.push({productName:'',number:1,confirm:false,rest:0});
                        }
                    }
                })
            },
            change(e,row){
                for (let r of this.productList){
                    if (r.productName === e){
                        row.rest = r.number;
                    }
                }
            },
            add(){
                this.choosedList.push({productName:'',number:1,confirm:false,rest:0});
            },
            del(i){
                this.choosedList.splice(i,1);
            },
            submit(r){
                this.$http.post(this.apis.stock.outStock,r).then((res)=>{
                    if(res.code === 200){
                        this.$Message.success(res.message);
                        r.confirm = true;
                        r.rest -= r.number;
                    }else{
                        this.$Message.error(res.message);
                    }
                })
            },
            revert(r){
                this.$http.post(this.apis.stock.revert,r).then((res)=>{
                    if(res.code === 200){
                        this.$Message.success(res.message);
                        r.confirm = false;
                        r.rest += r.number;
                    }else{
                        this.$Message.error(res.message);
                    }
                })
            },
            close(){
                let v = this;
                v.showModal = false;
                this.$parent.productData = this.choosedList;
                setTimeout((t) => {
                    v.$parent.componentName = "";
                }, 200)
            }
        }
    }
</script>

<style scoped>

</style>
