<template>
	<div id="bill-list">
		<!--顶部-->
		<header>
			<div>
				<img src="/more/back.png" @click="back()">
			</div>
			<p>订单列表</p>
		</header>
		<!-- 预约订单列表 -->
		<div class="list" v-for="temp in list">
			<div class="one">
				<p>{{temp.orderdata}}</p>
				<p>{{temp.name}}</p>
			</div>
			<div class="two">
				<a href="javascript:void(0)">取消预约</a>
			</div>
		</div>
		<!-- 导入底部组件 -->
		<Footer></Footer>
	</div>
</template>
<script setup>
	import Footer from "../common/Footer.vue";
	import {
		getLocal
	} from "../../assets/js/common.js";
	import {
		ref,
		onMounted,
		inject
	} from 'vue';
	import {
		useRouter
	} from "vue-router";
	//拿到axios对象
	const axios = inject('axios');
	// 创建路由跳转对象
	const router = useRouter();
	//声明返回
	const back = () => {
		router.back();
	}
	//声明响应式动态数组
	const list = ref([]);
	//直接显示某个用户的所有的预约订单
	onMounted(() => {
		let userId = getLocal('userId');
		axios.get('orders/query?userId=' + userId).then((res) => {
			if (res.data.code == 1000) {
				list.value = res.data.data;
			}
		}).catch((error)=>{
			console.log(error);
		})
	});
</script>

<style scoped>
	#bill-list {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-bottom: 14vw;
	}

	/* 顶部样式 */
	#bill-list>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: white;
		display: flex;
		align-items: center;
		color: dimgray;
		margin-bottom: 2vw;
	}

	#bill-list>header>div>img {
		width: 6vw;
	}

	#bill-list>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 28vw;
	}

	/* 预约订单列表 */
	#bill-list>.list {
		/* 变成边框盒子后,再加弹性就可以设置内间距了 */
		box-sizing: border-box;
		width: 100%;
		height: 10vh;
		background-color: white;
		display: flex;
		justify-content: space-between;
		align-items: center;
		/* 左右内间距 */
		padding-left: 4vw;
		padding-right: 6vw;
	}

	#bill-list>.list>.one>p:nth-of-type(1) {
		color: grey;
	}

	#bill-list>.list>.one>p:nth-of-type(2) {
		font-weight: bold;
		color: dimgrey
	}

	#bill-list>.list>.two>a {
		color: orange;
		padding: 2vw 0;
	}
</style>