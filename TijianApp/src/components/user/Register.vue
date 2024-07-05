<template>
	<div class="wrapper">
		<!-- header部分 -->
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>用户注册</p>
		</header>
		<!-- 表单部分 -->
		<ul class="form-box">
			<li>
				<div class="title">用户号：</div>
				<div class="content">
					<!-- 网页标签上直接动态对象.属性,不用加value -->
					<input type="text" @blur="checkUserId()" v-model="user.userId" placeholder="输入用户Id" />
				</div>
			</li>
			<li>
				<div class="title">密码：</div>
				<div class="content">
					<input type="password" v-model="user.password" placeholder="输入密码" />
				</div>
			</li>
			<li>
				<div class="title">确认密码：</div>
				<div class="content">
					<input type="password" v-model="confirmPassword" placeholder="确认密码" />
				</div>
			</li>
			<li>
				<div class="title">真实姓名：</div>
				<div class="content">
					<input type="text" v-model="user.realName" placeholder="输入姓名" />
				</div>
			</li>
			<li>
				<div class="title">性别：</div>
				<div class="content" style="font-size: 3.2vw">
					<input type="radio"  value="1" v-model="user.gender" style="width: 6vw; height: 3.2vw" />男
					<input type="radio"  value="0" v-model="user.gender" style="width: 6vw; height: 3.2vw" />女
				</div>
			</li>
			<li>
				<div class="title">身份证号：</div>
				<div class="content">
					<input type="text" v-model="user.identityCard" placeholder="输入身份证" />
				</div>
			</li>
			<li>
				<div class="title">生日：</div>
				<div class="content">
					<!-- 日期选择器 -->
					<!-- <input type="text" v-model="user.birthday" placeholder="yyyy-mm-dd" /> -->
					<el-date-picker v-model="user.birthday" type="date" placeholder="yyyy-mm-dd" />
				</div>
			</li>
			<li>
				<div class="title">注册类型：</div>
				<div class="content" style="font-size:3.2vw;color: grey;">
					<input type="radio" v-model="user.userType" value="1" style="width: 6vw; height: 3.2vw" />普通用户
					<!-- 1普通用户2内部员工3其他 -->
					<input type="radio" v-model="user.userType" value="2" style="width: 6vw; height: 3.2vw" />内部员工
					<input type="radio" v-model="user.userType" value="3" style="width: 6vw; height: 3.2vw" />其他
				</div>
			</li>
		</ul>
		<div class="button-register">
			<button @click="register()">注&ensp;册</button>
		</div>
		<div class="button-login">
			<button @click="login()">去登录</button>
		</div>
		<!--直接使用组件别名，作为标签来导入其它组件中的网页内容，底部菜单部分 -->
		<Footer></Footer>
	</div>
</template>
<!--新语法糖格式:简洁的代码风格-->
<script setup>
	//导入底部组件	
	import Footer from '../common/Footer.vue';
	//导入json字符串解析工具
	import qs from "qs";
	//导入路由组件useRouter实现跳转,useRoute获取其它路由传过来的数据
	import {
		useRouter,
		useRoute
	} from 'vue-router';
	import axios from 'axios';
	import {
		ref
	} from 'vue';
	//////声明动态对象或变量//////
	//创建路由对象,用于跳转并传参
	const router = useRouter();
	//创建路由数据管理对象,用于获取其它路由传过来的数据
	const route = useRoute();
	//用户注册信息,动态对象,在js代码中存取值要用value,在网页标签中直接存取
	const user = ref({
		userId: "", //用户id或用户名
		password: "", //密码
		gender:1, //性别1男0女
		realName: "", //用户姓名
		identityCard: "", //身份证号
		birthday:"1970-1-1", //初始化用户生日
		userType: 2 //用户类型1普通用户2内部员工3其他
	});
	//声明动态字符串
	const confirmPassword = ref("");

	//////声明方法或函数//////
	//声明一个失去焦点的事件:用于检查用户号是否存在
//////声明方法或函数//////
//声明一个失去焦点的事件:用于检查用户号是否存在
const checkUserId = () => {
	// Log the data being sent to the backend
	console.log("Data sent to backend for checkUserId:", {
		userId: user.value.userId
	});

	axios
		.post(
			"user/judge",
			//post方法:需要json工具将js对象转成后端能接收传参方式的数据,后端会通过userId参数取值
			//userId=10008&password=123
			qs.stringify({
				userId: user.value.userId
			})
		)
		.then((response) => { //获取后端传回的数据resultvo,拿后端数据为response.data
			if (response.data.code == 1001) {
				//response.msg
				alert("用户Id已存在");
			}
		})
		.catch((error) => {
		});
};

//点击按钮,执行注册
const register = () => {
	//注册前做校验
	if (user.value.userId == "") {
		alert("用户Id不能为空！");
		return;
	}
	if (user.value.password == "") {
		alert("密码不能为空！");
		return;
	}
	if (user.value.password != confirmPassword.value) {
		alert("两次输入的密码不一致！");
		return;
	}

	// Log the data being sent to the backend
	console.log("Data sent to backend for register:", user.value);

	//注册请求
	//post方法:需要使用json工具qs将js对象转换成带参数方式username=tom&password=123&gender=男
	axios
		.post("user/register", qs.stringify(user.value))
		.then((response) => { //resultvo:{code:xxx,data:{   },msg:xxx}
			if (response.data.code == 1000) { //拿后端数据为response.data
				alert("注册成功!");
			} else {
				alert("注册失败!");
			}
		})
		.catch((error) => {
			console.error("请求有误");
		});
	//register结束	
};

	//去登录
	const login = () => {
		router.push({
			path: '/login'
		})
	}
	//返回
	const back = () => {
		router.back();
	}
</script>
<!--scoped,样式范围限定,只作用当前组件,防止其它组件污染当前组件样式-->
<style scoped>
	/****************** 总容器 ******************/
	.wrapper {
		width: 100%;
		background-color: white;
		padding-bottom: 5vw;
	}

	/****************** header部分 ******************/
	.wrapper>header {
		width: 100%;
		/* 子元素设置高 */
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
		/* 相对定位 */
		position: relative;
		left: 28vw;
	}

	/****************** 表单部分 ******************/
	.wrapper .form-box {
		width: 100%;
		margin-top: 12vw;
	}

	.wrapper .form-box li {
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
		display: flex;
		align-items: center;
	}

	.wrapper .form-box li .title {
		flex: 0 0 18vw;
		font-size: 3.5vw;
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

	/* 注册*/
	.wrapper .button-register {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-register button {
		width: 100%;
		height: 10vw;
		font-size: 4vw;
		font-weight: 700;
		color: #666;
		background-color: #eee;
		border-radius: 4px;
		border: none;
		outline: none;
		border: solid 1px #ddd;
	}

	/* 登录*/
	.wrapper .button-login {
		width: 100%;
		box-sizing: border-box;
		padding: 4vw 3vw 0 3vw;
	}

	.wrapper .button-login button {
		width: 100%;
		height: 10vw;
		font-size: 3.8vw;
		font-weight: 700;
		color: #fff;
		background-color: #38ca73;
		border-radius: 4px;
		border: none;
		outline: none;
	}
</style>