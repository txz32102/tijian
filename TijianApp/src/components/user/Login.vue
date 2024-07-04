<template>
	<div class="wrapper">
		<!-- header部分 -->
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>用户登录</p>
		</header>
		<!-- 表单部分 -->
		<ul class="form-box">
			<li>
				<div class="title">用户号：</div>
				<div class="content">
					<input type="text" v-model="userId" placeholder="输入用户号" />
				</div>
			</li>
			<li>
				<div class="title">密码：</div>
				<div class="content">
					<input type="password" v-model="password" placeholder="输入密码" />
				</div>
			</li>
		</ul>

		<div class="button-login">
			<button @click="login">登&ensp;录</button>
		</div>
		<!-- 注册按钮 -->
		<div class="button-register">
			<!--跳转到注册组件-->
			<button @click="register">去注册</button>
		</div>
		<!-- 底部菜单部分 -->
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from "../common/Footer.vue";
	import qs from "qs";
	import {
		useRouter
	} from "vue-router";
	import {
		ref,
		inject
	} from "vue";
	import {
		saveSession,
		saveLocal
	} from "../../assets/js/common.js";
	const router = useRouter();
	//声明动态变量
	const userId = ref("");
	const password = ref("");
	//注入axios对象
	const axios = inject("axios");
	////////(1)用户登录///////
	const login = () => {
		if (userId.value == "") {
			alert("用户号不能为空！");
			return;
		}
		if (password.value == "") {
			alert("密码不能为空！");
			return;
		}
		//执行登录
		axios.post("user/login?userId=" + userId.value + "&password=" + password.value).then((res) => {
			let code = res.data.code;
			let us = res.data.data;
			if (code == 1000) {
				//全局存入用户id
				saveLocal("userId", userId.value)
				//同时缓用户相关信息:realName,出生,身份证号,手机
				let user = {
					userId: us.userId,
					realName: us.realName,
					cardId: us.identityCard,
					birthday: us.birthday,
					mobile: '13901234567'
				}
				//保存缓存对象
				saveLocal('user', user);
				router.push("/")
			} else {
				alert(res.data.message)
			}
		})
	}
	//////(2)用户注册/////
	const register = () => {
		router.push({
			path: "register"
		});
	};
	////返回
	const back = () => {
		router.back();
	}
</script>
<!--scoped,样式范围限定,只作用当前组件,防止其它组件污染当前组件样式-->
<style scoped>
	/* 总容器 */
	.wrapper {
		width: 100%;
		background-color: white;
		padding-bottom: 8vw;
	}

	/* header部分 */
	.wrapper>header {
		width: 100%;
		height: 8vh;
		background-color: #0097ff;
		display: flex;
		align-items: center;
		color: white;
	}

	.wrapper>header>div>img {
		width: 6vw;
	}

	.wrapper>header>p {
		font-size: 6vw;
		font-weight: bold;
		position: relative;
		left: 30vw;
	}

	/* 表单部分 */
	.wrapper .form-box {
		width: 100%;
		margin-top: 4vw;
		border-radius: 8px;
		box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2);
		background-color: white;
		overflow: hidden;
	}

	.wrapper .form-box li {
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
		display: flex;
		align-items: center;
		height: 20vw;
	}

	.wrapper .form-box li .title {
		flex: 0 0 18vw;
		font-size: 4vw;
		font-weight: 600;
		color: #666;
	}

	.wrapper .form-box li .content {
		flex: 1;
	}

	.wrapper .form-box li .content input {
		border: none;
		outline: none;
		width: 100%;
		height: 8vw;
		font-size: 4vw;
	}

	/* 登录按钮 */
	.wrapper .button-login {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-login button {
		width: 100%;
		height: 12vw;
		font-size: 4vw;
		font-weight: 700;
		color: white;
		background-color: #38ca73;
		border-radius: 4px;
		border: none;
		outline: none;
	}

	.wrapper .button-login button:hover {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}

	/* 注册按钮 */
	.wrapper .button-register {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-register button {
		width: 100%;
		height: 12vw;
		font-size: 4vw;
		font-weight: 700;
		color: #666;
		background-color: #eee;
		border: solid 1px #ddd;
		border-radius: 4px;
		outline: none;
	}

	.wrapper .button-register button:hover {
		box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	}
</style>