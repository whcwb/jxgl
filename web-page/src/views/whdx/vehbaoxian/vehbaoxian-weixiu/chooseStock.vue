<template>
    <Modal v-model="showModal" width='900' :closable='false'
           :mask-closable="false" title="选择商品">
        <div style="overflow: auto;height: 500px;">
            <Form
                    ref="form"
                    :model="formItem"
                    :rules="ruleInline"
                    :label-width="100"
                    :styles="{top: '20px'}">
                <Row>
                    <Col span="12">
                        <FormItem prop='productName' label='商品名称'>
                            <Select v-model="formItem.productName" @on-change="change">
                                <Option v-for="(item,index) in productList" :key="index" :value="item.productName">{{item.productName}}</Option>
                            </Select>
                            <label>剩余：{{rest}} 个</label>
                        </FormItem>
                    </Col>
                    <Col span="12">
                        <FormItem prop='number' label='商品数量'>
                            <InputNumber v-model="formItem.number"></InputNumber>
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
            }
        },
        created(){
            this.getProducts();
        },
        methods:{
            getProducts(){
                this.productList = [];
                this.$http.get(this.apis.stock.QUERY,{params:{pageSize:100}}).then((res)=>{
                    if (res.code === 200){
                        this.productList = res.page.list;
                    }
                })
            },
            change(e){
                for (let r of this.productList){
                    if (r.productName === e){
                        this.rest = r.number;
                    }
                }
            }
        }
    }
</script>

<style scoped>

</style>
