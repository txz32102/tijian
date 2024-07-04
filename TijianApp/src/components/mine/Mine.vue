<template>
    <div id="mine">
        <!--顶部-->
        <header>
            <div>
                <img src="/more/back.png" @click="back">
            </div>
            <p>个人中心</p>
        </header>
        <div class="info">
            <!-- 用户信息 -->
            <div class="user">
                <div class="pic">
                    <!-- 可以根据用户性别动态加载男或女生图片girla.png -->
                    <img src="/more/boya.png">
                </div>
                <div class="detail">
                    <p>张三丰</p>
                    <p>
                        <span>帐号：</span>
                        <span>13901234567</span>
                    </p>
                </div>
            </div>
            <!-- 登录注册-->
            <div class="login-reg">
                <el-button type="primary" @click="goLogin">登录</el-button>
                <el-button type="primary" @click="goRegister">注册</el-button>
            </div>
        </div>

        <!-- 更多信息 -->
        <div class="yuyuebill">
            <span>预约订单</span>
            <a href="/billlist">
                <img src="/more/next.png">
            </a>
        </div>
        <div class="myservice">
            <span>我的服务</span>
            <a href="#">
                <img src="/more/next.png">
            </a>
        </div>
        <div class="mydoctor">
            <span>我的医生</span>
            <a href="#">
                <img src="/more/next.png">
            </a>
        </div>
        <div class="files">
            <span>健康档案</span>
            <a href="/files">
                <img src="/more/next.png">
            </a>
        </div>
        <div class="exit">
            <span>退出登录</span>
            <a href="javascript:void(0)" @click="logout()">
                <img src="/more/next.png">
            </a>
        </div>
        <!-- 底部导航条 -->
        <Footer></Footer>
    </div>
</template>
<script setup>
    import Footer from '../common/Footer.vue';
    import { useRouter } from 'vue-router';
    // 创建路由跳转对象
    const router = useRouter();
    // 声明返回方法
    const back = () => {
        //返回上一页
        router.back();
    }
    // 跳转登录页
    const goLogin = () => {
        router.push({ path: '/login' });
    }
    // 跳转注册页
    const goRegister = () => {
        router.push({ path: '/register' });
    }
    // 退出登录
    const logout = () => {
        //清空缓存
        localStorage.clear();
        router.push({ path: '/index' });
    }
</script>
<style scoped>
    /* 其他样式保持不变 */
    #mine {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    /* 顶部样式 */
    #mine > header {
        width: 100%;
        height: 8vh;
        background-color: #0097ff;
        display: flex;
        align-items: center;
        color: white;
    }

    #mine > header > div > img {
        width: 6vw;
    }

    #mine > header > p {
        font-size: 6vw;
        font-weight: bold;
        position: relative;
        left: 28vw;
    }

    /* 用户信息 */
    #mine .info {
        background-color: #0097ff;
        width: 100%;
        height: 20vh;
        color: white;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        margin-bottom: 1vw;
        padding: 2vw;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    #mine .info .user {
        width: 100%;
        display: flex;
        height: 12vh;
        align-items: center;
    }

    #mine .info .user .pic {
        margin-left: 4vw;
        margin-right: 2vw;
    }

    #mine .info .user .pic img {
        width: 20vw;
    }

    #mine .info .user .detail p:nth-of-type(1) {
        font-weight: bold;
        font-size: 5vw;
    }
	#mine {
	    width: 100%;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	  }
	
	  #mine > .info {
	    background-image: url('/images/information.jpg'); 
	    background-size: cover; 
	    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); 
	    border-radius: 10px; 
	    width: 96%;
	    height: 20vh;
	    color: black; 
	    display: flex;
	    flex-direction: column;
	    justify-content: center;
	    align-items: center;
	    margin-bottom: 1vw;
	    padding: 2vw;
	  }
	
	  #mine > .info > .user {
	    width: 100%;
	    display: flex;
	    height: 12vh;
	    align-items: center;
	  }
	
	  #mine > .info > .user > .pic {
	    margin-left: 4vw;
	    margin-right: 2vw;
	  }
	
	  #mine > .info > .user > .pic > img {
	    width: 20vw;
	  }
	
	  #mine > .info > .user > .detail > p:nth-of-type(1) {
	    font-weight: bold;
	    font-size: 5vw;
	  }
	
	
	  #mine > .info > .login-reg {
	    display: flex;
	    justify-content: center;
	    margin-top: 2vh;
	  }

    /* 登录注册按钮 */
    #mine .login-reg {
        margin-top: 1vw;
        display: flex;
        justify-content: space-around;
    }

    #mine .login-reg el-button {
        font-size: 4.2vw;
        padding: 2vw;
    }

    /* 更多信息 */
    #mine > div:nth-of-type(n+2) {
        width: 100%;
        height: 8vh;
        display: flex;
        align-items: center;
        background-color: white;
        justify-content: space-between;
        margin-bottom: 1vw;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        transition: box-shadow 0.3s ease;
    }

    #mine > div:nth-of-type(n+2) > span {
        width: 36vw;
        text-align: center;
    }

    #mine > div:nth-of-type(n+2) > a {
        width: 16vw;
        height: 8vh;
        line-height: 8vh;
        text-align: center;
    }

    #mine > div:nth-of-type(n+2) > a > img {
        width: 5vw;
    }
	#mine > div:nth-of-type(n+2):hover {
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 悬停时的阴影效果 */
	}
</style>
