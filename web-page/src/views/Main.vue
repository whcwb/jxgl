<style lang="less">
    @import "./main.less";
</style>
<template>
    <div class="main" :class="{'main-hide-text': shrink}">
        <div class="sidebar-menu-con" :style="{width: shrink?'60px':'200px', overflow: shrink ? 'visible' : 'auto'}">
                <!--:theme="menuTheme"-->
            <shrinkable-menu
                :shrink="shrink"
                @on-change="handleSubmenuChange"
                :before-push="beforePush"
                :open-names="openedSubmenuArr"
                :menu-list="menuList">
                <div slot="top" class="logo-con">
                    <div v-show="!shrink" style="color: white;font-size: 9pt;background-color: rgb(45, 140, 240);border-radius: 10px;padding: 10px;text-align: center">{{title}}</div>
                    <div v-show="shrink" style="color: white;font-size: 9pt;background-color: rgb(45, 140, 240);border-radius: 10px;padding: 10px;text-align: center">W</div>
                    <!--<img v-show="!shrink"  src="../images/logo.png" key="max-logo" />-->
                    <!--<img v-show="shrink" src="../images/logo-min.png" key="min-logo" />-->
                </div>
            </shrinkable-menu>
        </div>
        <div class="main-header-con" :style="{paddingLeft: shrink?'60px':'200px'}">
            <div class="main-header">
                <div class="navicon-con">
                    <Button :style="{transform: 'rotateZ(' + (this.shrink ? '-90' : '0') + 'deg)'}" type="text" @click="toggleClick">
                        <Icon type="navicon" size="32"></Icon>
                    </Button>
                </div>
                <div class="header-middle-con">
                    <div class="main-breadcrumb" style="width: 300px;display: inline-block">
                        <breadcrumb-nav :currentPath="currentPath"></breadcrumb-nav>
                    </div>
                    <marquee  behavior="scroll" direction="left" align="middle"
                              scrolldelay="120"
                              style="font-size: 18px;width: 400px;;display: inline-block">
                        待办任务：
                        <span v-if="waitNotify === 0">暂无待办任务</span>
                        <span v-else>{{waitNotify}}</span>
                    </marquee>
                </div>
                <div class="header-avator-con">
                    <div class="user-dropdown-menu-con">
                        <Row type="flex" justify="end" align="middle" class="user-dropdown-innercon">
                            <span style="margin-right: 30px;">
                            	<span style="font-size: 18px;">
                            		<b>
                            			欢迎
                            		</b>
                            	</span>
                                <span class="main-user-name">{{ userName }}</span>
                            </span>
                            <Button type="primary" shape="circle" icon="person" @click="person" style="margin-right: 8px;"></Button>
                            <Button
                            	size="large"
                            	type="primary"
                            	shape="circle"
                            	@click="handleClickUserDropdown"
                            	@DOMMouseScroll="ButOnmouseover('移入')"
                            	@mousewheel="ButOnmouseover('移出')">
                            	<span>退出登陆</span>
                            	<!--<Icon type="ios-redo"></Icon>-->
                            </Button>
                        </Row>
                    </div>
                </div>
            </div>
            <div class="tags-con">
                <tags-page-opened :pageTagsList="pageTagsList"></tags-page-opened>
            </div>
        </div>
        <div class="single-page-con" :style="{left: shrink?'60px':'200px'}">
            <div class="single-page" style="height: 100%;">
                <keep-alive :include="cachePage" style="position: relative;height: 100%;">
                    <router-view></router-view>
                </keep-alive>
            </div>
        </div>
        <component
			:is="compName"></component>
    </div>
</template>
<script>
    import shrinkableMenu from './main-components/shrinkable-menu/shrinkable-menu.vue';
    import tagsPageOpened from './main-components/tags-page-opened.vue';
    import breadcrumbNav from './main-components/breadcrumb-nav.vue';
    import messageTip from './main-components/message-tip.vue';
    import themeSwitch from './main-components/theme-switch/theme-switch.vue';
    import Cookies from 'js-cookie';
    import util from '@/libs/util.js';

	import SockJS from 'sockjs-client';
    // 'sockjs-client' 必须与package.json文件当中dependencies 当中的一模一样
    import Stomp from '@stomp/stompjs';


	import pass from './passworld'
    export default {
        components: {
        	pass,
            shrinkableMenu,
            tagsPageOpened,
            breadcrumbNav,
            messageTip,
            themeSwitch
        },
        data () {
            return {
            	compName:'',
				scoketMess:[],
				scoketAllCar:[],
                waitNotify:0,
				shrink: false,
                userName: '',
                isFullScreen: false,
                openedSubmenuArr: this.$store.state.app.openedSubmenuArr
            };
        },
        computed: {
            title(){
                return this.$store.state.app.title;
            },
        	GetscoketMess() {
				return this.$store.state.app.socketMess
			},
			GetscoketAllCar() {
				return this.$store.state.app.socketAllCar
			},
            menuList () {
                return this.$store.state.app.menuList;
            },
            pageTagsList () {
                return this.$store.state.app.pageOpenedList; // 打开的页面的页面对象
            },
            currentPath () {
                return this.$store.state.app.currentPath; // 当前面包屑数组
            },
            avatorPath () {
                return localStorage.avatorImgPath;
            },
            cachePage () {
                return this.$store.state.app.cachePage;
            },
            lang () {
                return this.$store.state.app.lang;
            },
            menuTheme () {
                return []
            },
            mesCount () {
                return this.$store.state.app.messageCount;
            }
        },
        watch: {
            '$route' (to) {
                this.$store.commit('setCurrentPageName', to.name);
                this.checkTag(to.name);
                localStorage.currentPageName = to.name;
            },
            GetscoketMess: function(newQuestion, oldQuestion) {
				this.scoketMess = newQuestion
			},
            GetscoketAllCar:function(newQuestion, oldQuestion){
            	this.scoketAllCar = newQuestion
            }
        },
        mounted () {
            this.init();
        },
        created () {
            // 显示打开的页面的列表
            this.$store.commit('setOpenedList');
            this.getTip();
        },
        methods: {
            getTip(){
              this.$http.get(this.apis.waitNotify.QUERY,{params:{zt:0}}).then((res)=>{
                  if (res.code === 200 && res.page.list){
                      this.waitNotify = res.page.total;
                      let v = this
                      setTimeout(function(){
                          v.getTip()
                      },1000*60);
                  }
              })
            },
        	person(){
        		this.compName = 'pass'
        	},
        	ButOnmouseover(mes){
        	},
            init () {
                this.$store.commit('updateMenulist');
                this.userName = JSON.parse(Cookies.get('result')).userInfo.xm;
                let messageCount = 3;
                this.messageCount = messageCount.toString();
                this.checkTag(this.$route.name);
                this.$store.commit('setMessageCount', 3);
            },
            toggleClick () {
                this.shrink = !this.shrink;
            },
            handleClickUserDropdown (name) {
                    // 退出登录
                    Cookies.set('usermess', '');
                    this.$store.commit('logout', this);
                    this.$store.commit('clearOpenedSubmenu');
                    this.$store.commit('clearAllTags');//关闭多页面操作
                    this.$router.push({
                        name: 'login'
                    });
//              }
            },
            checkTag (name) {
//              let openpageHasTag = this.pageTagsList.some(item => {
//                  if (item.name === name) {
//                      return true;
//                  }
//              });
//              if (!openpageHasTag) { //  解决关闭当前标签后再点击回退按钮会退到当前页时没有标签的问题
//                  util.openNewPage(this, name, this.$route.params || {}, this.$route.query || {});
//              }
            },
            handleSubmenuChange (val) {
//                 log('路由',val)
            },
            beforePush (name) {
                return true;
            },
            fullscreenChange (isFullScreen) {
            }
        }
    };
</script>
