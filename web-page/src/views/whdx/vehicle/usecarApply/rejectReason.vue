<style type="text/css">
</style>
<template>
    <div>
        <Modal v-model="showModal" width='900' :closable='false'
               :mask-closable="false" :title="operate+''">
            <div style="overflow: auto;height: 500px;">
                <Form ref="formValidate" :model="formItem"
                      :rules="ruleValidate" :label-width="80">
                    <FormItem label="原因" prop="bhyy">
                        <Input v-model="formItem.bhyy" type="textarea" placeholder="请填写驳回原因"></Input>
                    </FormItem>
                </Form>
            </div>
            <div slot='footer'>
                <Button type="ghost" @click="v.util.closeDialog(v)">取消</Button>
                <Button type="primary" @click="confirm">确定</Button>
            </div>
        </Modal>
    </div>
</template>

<script>
    export default {
        name: 'usecarApplyForm',
        data() {
            return {
                v:this,
                operate:'驳回原因',
                showModal: true,
                readonly: false,
                formItem: {
                    bhyy:''
                },
                ruleValidate: {
                    bhyy: [
                        { required: true, message: '请认真填写驳回原因', trigger: 'blur' }
                    ]
                },
            }
        },
        created(){
            this.util.initFormModal(this);
        },
        methods: {
            confirm(){
                this.$parent.rejectConfirm(this.formItem.bhyy);
            }
        }
    }
</script>

<style>

</style>
