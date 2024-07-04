<template>
	<div id="select-date">
		<!-- 顶部 -->
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>选择体检日期</p>
		</header>
		<!-- 选日期 -->
		<div class="demo-date-picker">
			<div class="block">
				<el-date-picker v-model="mydate" type="date" placeholder="yyyy-mm-dd" />
			</div>
		</div>
		<el-button type="primary" class="next" @click="next">下一步</el-button>
		<!-- 底部导航条 -->
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from '../common/Footer.vue';
	import {getDateStr,getDate,saveLocal} from '../../assets/js/common.js';
	import {
		ref
	} from 'vue'
	import {
		useRouter
	} from 'vue-router';
	//动态获取选取的日期,初始化为当前日期
	const mydate = ref(new Date())
	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	}
	//到订单确认页
	const next = () => {
		//缓存预约的日期july week 2024-7-26
		let temp=mydate.value;
		//转成年月日后存入
		let str=getDateStr(temp);
		//将年月日字符串存入缓存
		saveLocal('mydate',str);
		//转成yyyy-mm-dd存入,以便存入数据库的订单表的Date类型的字段中
		let orderdate=getDate(temp);
		saveLocal('orderdate',orderdate);
		router.push({
			path: '/confirmbill'
		})
	}
</script>

<style scoped>
	#select-date {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	/* 顶部样式 */
	#select-date>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: #0097ff;
		display: flex;
		align-items: center;
		color: white;
		margin-bottom: 4vw;
	}

	#select-date>header>div>img {
		width: 6vw;
	}

	#select-date>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 20vw;
	}

	/*下一步*/
	#select-date>.next {
		position: fixed;
		bottom: 14vw;
		right: 0;
	}
</style>