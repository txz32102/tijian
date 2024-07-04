<template>
	<div id="tijian-report">
		<!--顶部-->
		<router-link to="/totalresult"></router-link>
		<header>
			<div>
				<!-- 返回按钮 -->
				<img src="/more/back.png" @click="back">
			</div>
			<p>
				<span>{{list[0].orderDate}}</span>体检报告
			</p>
		</header>
		<!-- 总检报告，详情报告，只添加两个按钮 -->
		<div class="nav">
			<button
				:class="['button', { active: activeButton === 'total', hover: hoverButton === 'total', inactive: activeButton === 'detail' || hoverButton === 'detail' }]"
				@click="goTotal" @mouseover="hoverButton = 'total'" @mouseout="hoverButton = ''">
				总检结论
			</button>
			<button
				:class="['button', { active: activeButton === 'detail', hover: hoverButton === 'detail', inactive: activeButton === 'total' || hoverButton === 'total' }]"
				@click="goDetail" @mouseover="hoverButton = 'detail'" @mouseout="hoverButton = ''">
				报告详情
			</button>
		</div>
		<!-- 按钮渲染 -->
		<div class="display">
			<!-- 内容将放入此容器中 -->
			<router-view></router-view>
		</div>
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from '../common/Footer.vue';
	import {
		ref,inject
	} from 'vue';
	import {
		useRouter,
		useRoute
	} from 'vue-router';
	import {
		getLocal,
		getDateStr
	} from "../../assets/js/common.js";

	const list = ref([]);

	const axios = inject('axios');

	// 创建路由跳转对象
	const router = useRouter();

	const route = useRoute()

	axios.get('getdetailresult/query?orderId=' + route.query.id).then((res) => {
		if (res.data.code == 1000) {
				list.value = res.data.data;
				list.value.forEach((l)=>{
					let temp = new Date(l.orderDate);
					l.orderDate = getDateStr(temp);
				})
			}
		}).catch((error)=>{
			console.log(error);
		})



	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	};

	// 定义按钮的激活状态
	const activeButton = ref('');
	const hoverButton = ref('');

	// 切换到总检报告内容页
	const goTotal = () => {
		activeButton.value = 'total';
		router.push({
			path: '/totalresult'
		});
	};

	// 切换到报告详情内容页
	const goDetail = () => {
		activeButton.value = 'detail';
		router.push({
			path: '/detailresult'
		});
	};

</script>

<style scoped>
	#tijian-report {
		/* 高度不设置,让内容去撑 */
		width: 100%;
	}

	/* 顶部样式 */
	#tijian-report>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: white;
		display: flex;
		align-items: center;
		color: dimgray;
	}

	#tijian-report>header>div>img {
		width: 6vw;
	}

	#tijian-report>header>p {
		font-size: 6vw;
		/* 相对定位 */
		position: relative;
		left: 9vw;
	}

	/* 按钮默认样式 */
	.nav .button {
		width: 50%;
		height: 6vh;
		border: none;
		outline: none;
		cursor: pointer;
		position: relative;
	}

	/* 鼠标悬停时的样式 */
	.nav .button.hover::after {
	  content: "";
	  position: absolute;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  height: 2px;
	  background-color: lightblue;
	}
	/* 按钮激活状态样式 */
	.nav .button.active::after {
		content: "";
		position: absolute;
		left: 0;
		right: 0;
		bottom: 0;
		height: 2px;
		background-color: darkturquoise;
	}

	.nav .button.active {
		color: darkturquoise;
	}

	/* 按钮非激活状态样式 */
	.nav .button.inactive {
		color: gray;
	}
	
</style>