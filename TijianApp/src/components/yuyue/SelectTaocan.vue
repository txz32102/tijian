<template>
	<div id="select-taocan">
		<!-- 顶部 -->
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>选择体检套餐</p>
		</header>
		<!-- 套餐 -->
		<div class="taocan" v-for='tc in taocan'>
			<!-- 传套餐对象 -->
			<div class="left" @click="goDate(tc)">
				<p v-text="tc.type==1?'男士套餐':'女士套餐'"></p>
				<p v-text="tc.name"></p>
			</div>
			<!-- 去选取日期 -->
			<div class="right">
				<span>
					详情&ensp;<img src="/more/arrow-down.png">
				</span>
			</div>
		</div>
		<!-- 底部导航条 -->
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from '../common/Footer.vue';
	import {
		saveLocal
	} from '../../assets/js/common.js';
	import {
		useRouter
	} from 'vue-router';
	import {
		ref,
		inject,
		onMounted
	} from 'vue';
	//生成axios
	const axios = inject("axios");
	//创建响应式动态数组
	var taocan = ref([]);
	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	}
	const goDate = (tc) => { //到日期页
		//存入套餐id与套餐价格
		let setmeal = {
			smId: tc.smId,
			price: tc.price
		}
		//存入
		saveLocal('setmeal',setmeal)
		// 缓存体检套餐
		router.push({
			path: '/date'
		})
	}
	////与后端交互////
	onMounted(() => { //当前组件挂载成功后自动执行此方法
		axios.get('setmeal/getAll').then((res) => {
			let code = res.data.code;
			if (code == 1000) {
				taocan.value = res.data.data;
			} else {
				console.log(res.data.message);
			}
		}).catch((error) => {
			console.log(error);
		});
	});
</script>

<style scoped>
	#select-taocan {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-bottom: 14vw;
	}

	/* 顶部样式 */
	#select-taocan>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: #0097ff;
		display: flex;
		align-items: center;
		color: white;
		margin-bottom: 4vw;
	}

	#select-taocan>header>div>img {
		width: 6vw;
	}

	#select-taocan>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 20vw;
	}

	/* 套餐样式 */
	#select-taocan>.taocan {
		width: 100%;
		height: 12vh;
		border-radius: 2vw;
		background-color: white;
		margin-top: 4vw;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	#select-taocan>.taocan>.left {
		width: 70vw;
		/* background-color: pink; */
		padding-left: 10vw;
	}

	#select-taocan>.taocan>.left>p:nth-of-type(1) {
		font-weight: bold;
		margin-bottom: 1vw;
	}

	#select-taocan>.taocan>.left>p:nth-of-type(2) {
		color: grey;
	}

	#select-taocan>.taocan>.right {
		width: 30vw;
		/* background-color: pink; */
		height: 10vh;
		text-align: center;
		line-height: 10vh;
		color: grey;
		border-left: 1px solid #ccc;
	}
</style>