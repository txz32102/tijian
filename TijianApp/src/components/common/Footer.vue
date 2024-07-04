<!-- 内容 -->
<template>
	<ul id="footer">
		<li @click="home">
			<img :src="navs[0]">
			<p :class="i==0?myblue:mygrey">云医院</p>
		</li>
		<li @click="yuyue">
			<img :src="navs[1]">
			<p :class="i==1?myblue:mygrey">预约</p>
		</li>
		<li @click="bill" >
			<img :src="navs[2]">
			<p :class="i==2?myblue:mygrey">订单</p>
		</li>
		<li @click="mine" >
			<img :src="navs[3]">
			<p :class="i==3?myblue:mygrey">我的</p>
		</li>
	</ul>
</template>
<!-- 新语法糖,动态数据 -->
<script setup>
	import {
		useRouter,//跳转并传参
		useRoute//获取路由传参的数据
	} from 'vue-router';
	import {
		ref
	} from 'vue';
	//创建系统的路由对象
	const router = useRouter();
	//创建路由数据管理对象
	const route = useRoute();
	//设置点击按钮的文本颜色
	var mygrey="grey";
	var myblue="blue";
	//初始化动态数组
	var navs = ref(['/nav/homea.png', '/nav/yuyuea.png', '/nav/billa.png', '/nav/abouta.png'])
	//设置选中后的导航图片
	var temp = ['/nav/homeb.png', '/nav/yuyueb.png', '/nav/billb.png', '/nav/aboutb.png'];
	//取路由传参数据
	var i = route.query.index;
    //设置点击后的图片
	if (i != undefined && i != null) {
		i=parseInt(i);//转成整型,便于判断是哪个按钮
		navs.value[i] = temp[i];
	} else {
		i=0;//便于判断是哪个按钮
		navs.value[0] = temp[0];
	}
	//声明方法，实现跳转	
	const home = () => {//到首页
		//通过路由对象跳转
		router.push({
			path: '/',
			query: {//路由传参
				index: "0"
			}
		})
	}
	const yuyue = () => {//到预约
		router.push({
			path: '/yuyue',
			query: {//路由传参
				index: "1"
			}
		})
	}
	const bill = () => {//到订单
		router.push({
			path: '/billlist',
			query: {//路由传参
				index: "2"
			}
		})
	}
	const mine = () => {//到我的
		router.push({
			path: '/mine',
			query: {//路由传参
				index: "3"
			}
		})
	}
</script>
<!-- 样式 -->
<style scoped>
	.blue{
		color:#0097ff;
	}
	.grey{
		color:grey;
	}
	/* 去除项目符号 */
	ul,
	li {
		list-style: none;
	}

	#footer {
		width: 100%;
		/*用屏宽的比例来设置*/
		height: 14vw;
		display: flex;
		/* 水平方向分散对齐 */
		justify-content: space-around;
		/* 底部导航条顶部边框 */
		border-top: 1px solid #eee;
		/* 固定定位 */
		position: fixed;
		/* 底部对齐 */
		bottom: 0;
		/* 左对齐 */
		left: 0;
		background-color: white;
	}

	#footer>li {
		height: 100%;
		/* 宽度都一致 */
		flex-grow: 1;
		/* 文本与图片水平对齐 */
		text-align: center;
		font-size: 3vw;
		color: grey;
	}

	#footer>li>img {
		width: 6vw;
		margin-top: 2vw;
	}
</style>