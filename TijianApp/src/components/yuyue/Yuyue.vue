<template>
	<div id="yuyue">
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>请您选择体检机构</p>
		</header>
		<!-- 直接取动态数组的值 -->
		<div class="list" v-for="h in hs">
			<p>
				{{h.name}}
				<img src="/more/next.png" @click="next(h)">
			</p>
			<div class="content">
				<div>
					<!-- 图片地址的拼接 -->
					<img :src="`/hospital/${h.picture}`">
				</div>
				<div>
					<p>
						<span>营业时间</span>
						<span v-text="h.businesshours"></span>
					</p>
					<p>
						<span>采血截止</span>
						<!-- 时间 -->
						<span v-text="h.deadline"></span>
					</p>
					<p>
						<span>电话</span>
						<!-- 电话 -->
						<span v-text="h.telephone"></span>
					</p>
					<p>
						<span>地址</span>
						<!-- 地址 -->
						<span v-text="h.address"></span>
					</p>
					<!-- 按钮 -->
					<div>
						<el-button type="primary" plain>
							<img src="/more/tel.png">联系我们
						</el-button>
						<el-button type="primary" plain>
							<img src="/more/pos.png">查找位置
						</el-button>
					</div>
				</div>
			</div>
		</div>
		<!-- 加载底部组件 -->
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from '../common/Footer.vue';
	import {
		saveLocal
	} from "../../assets/js/common.js";
	import {
		ref,
		reactive,
		inject,
		onMounted
	} from 'vue';
	import {
		useRouter
	} from 'vue-router';
	//声明动态数组,存储后端提供的医院信息[{},{},{},{}]
	const hs = ref([]);
	//声明axios对象
	const axios = inject("axios");
	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		router.back();
	}
	// 到下一页
	const next = (h) => {
		//缓存某个选择医院对象:hpId,name,businesshours,deadline,telephone,address
		let hospital={
			hpId:h.hpId,
			name:h.name,
			businesshours:h.businesshours,
			deadline:h.deadline,
			telephone:h.telephone,
			address:h.address
		}
		//缓存到loalStorage中
		saveLocal('hospital',hospital);
		router.push({
			path: '/taocan'
		})
	}
	////////方法的声明//////////
	onMounted(() => { //自动执行
		axios.get('hospital/getAll').then((res) => {
			//hs.value=res.data.data;
			let code = res.data.code;
			if (code == 1000) {
				//将拿到的js数组赋值组hs动态数对象
				hs.value = res.data.data;
			} else {
				alert("系统有误");
				return;
			}
		}).catch((error) => {
			console.log(error);
		});
	});
</script>

<style scoped>
	#yuyue {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		/* 防止下边列表的内容被底部导航条覆盖了 */
		padding-bottom: 14vw;
	}

	/* 顶部样式 */
	#yuyue>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: #0097ff;
		display: flex;
		align-items: center;
		color: white;
	}

	#yuyue>header>div>img {
		width: 6vw;
	}

	#yuyue>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 20vw;
	}

	/* 医院列表 */
	#yuyue>.list {
		/* 左右留白 */
		width: 94vw;
		height: 60vw;
		background-color: white;
		margin-top: 2vw;
		/* 圆角边框 */
		border-radius: 1vw;
		/* 阴影 */
		box-shadow: 2px 2px 6px grey;
		position: relative;
	}

	#yuyue>.list>p {
		display: flex;
		height: 12vw;
		justify-content: space-between;
		align-items: center;
		font-weight: bold;
		font-size: 4.2vw;
		border-left: 4px solid #0097ff;
		margin-top: 2vw;
		margin-bottom: 1vw;
		padding-left: 2vw;
	}

	#yuyue>.list>p>img {
		width: 8vw;
		height: 5vw;
		margin-right: 2vw;
	}

	#yuyue>.list>.content {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		color: grey;
	}

	#yuyue>.list>.content>div:nth-of-type(1) {
		width: 20vw;
		/* background-color: pink; */
	}

	#yuyue>.list>.content>div:nth-of-type(1)>img {
		width: 20vw;
		height: 18vw;
	}

	#yuyue>.list>.content>div:nth-of-type(2) {
		width: 72vw;
	}

	#yuyue>.list>.content>div:nth-of-type(2)>div {
		/* background-color: pink; */
		/* 参考外层父元素为相对定位,让它的位置固定在底部*/
		position: absolute;
		bottom: 2.3vw;
	}

	/* 详情文本 */
	#yuyue>.list>.content>div:nth-of-type(2)>p {
		margin-bottom: 1vw;
		display: flex;
		justify-content: space-between;
	}

	#yuyue>.list>.content>div:nth-of-type(2)>p>span:nth-of-type(1) {
		/* 弹性盒子元素的占比  */
		flex: 7;
		/* background-color: gold; */
	}

	#yuyue>.list>.content>div:nth-of-type(2)>p>span:nth-of-type(2) {
		/* 弹性盒子元素的占比  */
		flex: 20;
		/* background-color: pink; */
	}
</style>