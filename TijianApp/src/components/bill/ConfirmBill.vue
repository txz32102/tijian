<template>
	<div id="confirm-bill">
		<!--顶部-->
		<header>
			<div>
				<img src="/more/backwhite.png" @click="back">
			</div>
			<p>确认您的订单</p>
		</header>
		<!-- 体检人信息 -->
		<div class="person">
			<header>
				体检人信息
			</header>
			<p>
				<span>姓名</span>
				<span v-text="user.realName"></span>
			</p>
			<p>
				<span>证件号码</span>
				<span v-text="user.cardId"></span>
			</p>
			<p>
				<span>出生日期</span>
				<span v-text="user.birthday"></span>
			</p>
			<p>
				<span>手机号码</span>
				<span>13901234567</span>
			</p>
		</div>
		<!-- 体检日期 -->
		<div class="date">
			<header>
				体检日期
			</header>
			<p>
				{{mydate}}
			</p>
		</div>
		<!-- 体检机构 -->
		<div class="institution">
			<header>
				体检机构
			</header>
			<p v-text="hospital.name">
			</p>
			<p>
				<span>营业时间</span>
				<span v-text="hospital.businesshours"></span>
			</p>
			<p>
				<span>采血截止</span>
				<span>
					采血截止时间{{hospital.deadline}}
				</span>
			</p>
			<p>
				<span>机构电话</span>
				<span v-text="hospital.telephone"></span>
			</p>
			<p>
				<span>机构地址</span>
				<span v-text="hospital.address"></span>
			</p>
		</div>
		<div class="pay">
			<p>
				<span>实付款&ensp;</span>
				<!-- 体检套餐订单价格 -->
				<span>&yen;{{setmeal.price}}</span>
			</p>
			<!--此处要生成订单,将orderdate,userId,hpId,smId,state写入数据库中的orders表-->
			<el-button type="primary" class="next" @click="confirm">确认支付</el-button>
		</div>
		<!-- 底部导航条 -->
		<Footer></Footer>
	</div>
</template>

<script setup>
	import qs from 'qs';
	import Footer from '../common/Footer.vue';
	import {
		getLocal
	} from '../../assets/js/common.js';
	import {
		onMounted,
		ref,
		inject
	} from 'vue';
	import {
		useRouter
	} from 'vue-router';
	//生成axios对象
	const axios = inject('axios');
	//创建响应式的动态对象
	var user = ref({});
	var hospital = ref({});
	var orderdate = ref({});//用于存入订单表orders
	var mydate=ref({})//用于在当前页显示
	var setmeal = ref({});
	//初始化页面
	onMounted(() => {
		////取user,hospital,orderdate并赋值组响应对象
		////最后渲染给当前组件
		user.value = getLocal('user');
		hospital.value = getLocal('hospital');
		orderdate.value = getLocal('orderdate');
		mydate.value=getLocal('mydate');
		setmeal.value = getLocal('setmeal');
	})
	// 创建路由跳转对象
	const router = useRouter();
	// 声明返回方法
	const back = () => {
		//返回上一页
		router.back();
	}
	const confirm = () => {
		//生成订单存入后端数据库,订单state默认存入1表示未归档
		//将orderdate,userId,hpId,smId,state写入数据库中的orders表
		let orders = {
			orderdate: orderdate.value,
			userId: user.value.userId,
			hpId: hospital.value.hpId,
			smId: setmeal.value.smId,
			state: 1
		}
		//调用后端实现订单的添加
		axios.post('orders/add', qs.stringify(orders)).then((res) => {
			if (res.data.code = 1000) {
				router.push({ //跳到订单成功页
					path: '/billok'
				});
			} else {
				alert('订单生成有误')
			}
		}).catch((error)=>{
			console.log(error);
		});
	}
</script>

<style scoped>
	#confirm-bill {
		/* 高度不设置,让内容去撑 */
		width: 100%;
		display: flex;
		flex-direction: column;
		align-items: center;
		padding-bottom: 26vw;
	}

	/* 顶部样式 */
	#confirm-bill>header {
		width: 100%;
		/* 子元素设置高 */
		height: 8vh;
		background-color: #0097ff;
		display: flex;
		align-items: center;
		color: white;
		margin-bottom: 4vw;
	}

	#confirm-bill>header>div>img {
		width: 6vw;
	}

	#confirm-bill>header>p {
		font-size: 6vw;
		font-weight: bold;
		/* 相对定位 */
		position: relative;
		left: 20vw;
	}

	/* 体检人,日期,机构 */
	#confirm-bill>.person,
	#confirm-bill>.date,
	#confirm-bill>.institution {
		width: 98%;
		background-color: white;
		border-radius: 1.2vw;
		margin-bottom: 2vw;
		padding-left: 2vw;
		padding-top: 2vw;
	}

	/* 体检人,日期,机构 */
	#confirm-bill>.person>header,
	#confirm-bill>.date>header,
	#confirm-bill>.institution>header {
		font-weight: bold;
		padding-left: 4vw;
		border-left: 4px solid #0097ff;
	}

	#confirm-bill>.person>p,
	#confirm-bill>.date>p,
	#confirm-bill>.institution>p {
		color: grey;
		padding-top: 2vw;
		padding-bottom: 2vw;
		display: flex;
		justify-content: space-between;
	}

	#confirm-bill>.person>p>span:nth-of-type(1),
	#confirm-bill>.institution>p>span:nth-of-type(1) {
		width: 20vw;
		margin-right: 1vw;
	}

	#confirm-bill>.person>p>span:nth-of-type(2),
	#confirm-bill>.institution>p>span:nth-of-type(2) {
		width: 80vw;
		margin-right: 1vw;
	}

	/* 确认支付  */
	#confirm-bill>.pay {
		width: 100%;
		height: 12vw;
		display: flex;
		justify-content: space-between;
		background-color: white;
		align-items: center;
		position: fixed;
		bottom: 14vw;
		left: 0;
	}

	#confirm-bill>.pay>p {
		margin-left: 4vw;
	}

	#confirm-bill>.pay>p>span:nth-of-type(2) {
		color: coral;
	}
</style>