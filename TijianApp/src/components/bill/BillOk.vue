<template>
	<div id="billok">
		<!--顶部-->
		<header>
			<div>
				<img src="/more/back.png" @click="back">
			</div>
			<!-- 已支付订单 -->
			<p>预约成功</p>
		</header>
		<div class="info">
			<div class="tips">
				<span>
					<img src="/more/good.png">
				</span>
			</div>
			<p>恭喜您预约成功</p>
			<p>请体检用户携带身到店认证</p>
			<input type="button" value="查看订单" @click="goBill">
			<input type="button" value="继续为家人预约">
			<p>本院为国家三甲机构</p>
			<p>预约信息已发送到您的手机</p>
			<p>
				客服电话:
				<span>400-6818-9999</span>
			</p>
		</div>
		<!-- 底部导航条 -->
		<Footer></Footer>
	</div>
</template>
<!-- 订单支付 -->
<script setup>
	import Footer from '../common/Footer.vue';
	import {
		ref
	} from 'vue'
	import {
		useRouter
	} from 'vue-router';
	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	}
	//到订单列表
	const goBill=()=>{
		router.push('/billlist');
	}
</script>

<style scoped>
	#billok {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	/* 顶部样式 */
	#billok>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: white;
		display: flex;
		align-items: center;
		color: dimgray;
	}

	#billok>header>div>img {
		width: 6vw;
	}

	#billok>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 28vw;
	}

	/* 预约信息 */
	#billok>.info {
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	#billok>.info>.tips {
		width: 100%;
		height: 20vh;
		background-color: #0097ff;
		position: relative;
	}

	#billok>.info>.tips>span {
		position: absolute;
		background-color: white;
		width: 16vw;
		height: 16vw;
		line-height: 20vw;
		text-align: center;
		border-radius: 50%;
		bottom: -8vw;
		left: 41vw;
	}

	#billok>.info>.tips>img {
		vertical-align: middle;
	}

	#billok>.info>p:nth-of-type(1) {
		width: 100%;
		height: 10vh;
		line-height: 14vh;
		text-align: center;
		font-size: 6vw;
		font-weight: bold;
		color: #0097ff;
		background-color: white;
	}

	#billok>.info>p:nth-of-type(2) {
		width: 100%;
		height: 6vh;
		line-height: 6vh;
		text-align: center;
		font-size: 4vw;
		color: dimgrey;
		background-color: white;
	}

	#billok>.info>input:nth-of-type(1) {
		width: 100%;
		height: 6vh;
		background: white;
		border: none;
		outline: medium;
		margin-top: 2vw;
		font-size: 4vw;
		color: #0097ff;
	}
	#billok>.info>input:nth-of-type(2) {
		width: 96%;
		height: 6vh;
		background: #0097ff;
		border: none;
		outline: medium;
		margin-top: 2vw;
		font-size: 4vw;
		color: white;
		border-radius: 2vw;
		margin-bottom: 6vw;
	}
	#billok>.info>p:nth-of-type(n+3){
		/* background-color: pink; */
		width: 100%;
		text-align: center;
		color: grey;
	}
</style>