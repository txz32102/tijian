<template>
	<div id="files">
		<!--顶部-->
		<header>
			<div>
				<img src="/more/back.png" @click="back">
			</div>
			<p>健康档案</p>
		</header>
		<div class="jiedu">
			<input type="button" value="点击免费咨询 >">
		</div>
		<!-- 报告 -->
		<div class="report" v-for="r in list">
			<div class="left">
				<div>
					<img src="/more/files.png">
				</div>
				<div class="info">
					<p><span>{{r.orderDate}}</span>&ensp;体检报告</p>
					<p>
						{{r.name}}
					</p>
				</div>
			</div>
			<div class="right">
				<img src="/more/next.png" @click="go(r.orderId)">
			</div>
		</div>
		<Footer></Footer>
	</div>
</template>

<script setup>
	import Footer from '../common/Footer.vue';
	import {
		getLocal,
		getDateStr,
		saveLocal
	} from "../../assets/js/common.js";
	import {
		useRouter
	} from 'vue-router';

	import{ref,onMounted,inject} from 'vue';

	const list = ref([]);

	const content = ref();

	const axios = inject('axios');

	onMounted(() => {
		let userId = getLocal('userId');
		axios.get('reports/query?userId=' + userId).then((res) => {
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
	});

	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	}
	// 切换到体检报告
	const go=(id)=>{
		router.push({
			name:"TijianReport",
			query:{
				id:id
			}
		});

		axios.get('getdetailresult/query?orderId=' + id).then((res) => {
			if (res.data.code == 1000) {
				list.value = res.data.data;
				saveLocal("detailResult",list);
				console.log(list.value);
			}
		}).catch((error)=>{
			console.log(error);
		})

		axios.get('getreportresult/query?id=' + id).then((res) => {
			if (res.data.code == 1000) {
				content.value = res.data.data;
				saveLocal("totalResult",content);
				console.log(content.value);
			}
		}).catch((error)=>{
			console.log(error);
		})

		console.log(id)
	}


</script>

<style scoped>
	#files {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
	}

	/* 顶部样式 */
	#files>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: white;
		display: flex;
		align-items: center;
		color: dimgray;
	}

	#files>header>div>img {
		width: 6vw;
	}

	#files>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 28vw;
	}

	/* 解读咨询 */
	#files>.jiedu {
		width: 100%;
		height: 21vh;
		background: url('/more/jiedu.jpg') no-repeat;
		background-size: 100% 100%;
		line-height: 29vh;
		text-align: center;
	}

	#files>.jiedu>input {
		width: 40vw;
		height: 10vw;
		background-color: white;
		border: none;
		outline: medium;
		font-size: 4.5vw;
		color: #46C3BD;
		border-radius: 6vw;
	}

	/* 体检报告 */
	#files>.report {
		box-sizing: border-box;
		width: 100%;
		height: 12vh;
		display: flex;
		justify-content: space-between;
		/* 子元素上下居中 */
		align-items: center;
		padding-left: 2vw;
		padding-right: 4vw;
		margin-bottom: 1vw;
		background-color: white;
	}

	#files>.report>.left {
		display: flex;
		height: 12vh;
		/* 子元素上下居中 */
		align-items: center;
	}
	#files>.report>.left>div>img{
		width: 12vw;
	}
	#files>.report>.left>.info{
		margin-left: 1vw;
	}
	#files>.report>.left>.info>p:nth-of-type(1){
		font-weight: bold;
		margin-bottom: 2vw;
	}
	#files>.report>.left>.info>p:nth-of-type(2){
		color:grey;
	}
	#files>.report>.right{
		height: 10vh;
		width: 15vw;
		line-height: 10vh;
		text-align: center;
	}
	#files>.report>.right>img{
		vertical-align: middle;
		width: 6.5vw;
	}
</style>