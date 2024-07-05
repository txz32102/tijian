<template>
	<div id="yuyue">
	  <header>
		<div>
		  <img src="/more/backwhite.png" @click="back">
		</div>
		<p>请您选择体检机构</p>
	  </header>
	  <div class="list" v-for="(h, index) in hs" :key="index">
		<p>
		  {{ h.name }}
		  <img src="/more/next.png" @click="next(h)">
		</p>
		<div class="content">
		  <div>
			<img :src="`/hospital/${h.picture}`">
		  </div>
		  <div>
			<p>
			  <span>营业时间</span>
			  <span v-text="h.businesshours"></span>
			</p>
			<p>
			  <span>采血截止</span>
			  <span v-text="h.deadline"></span>
			</p>
			<p>
			  <span>电话</span>
			  <span v-text="h.telephone"></span>
			</p>
			<p>
			  <span>地址</span>
			  <span v-text="h.address"></span>
			</p>
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
	  <Footer></Footer>
	</div>
  </template>
  
  <script setup>
  import Footer from '../common/Footer.vue';
  import { saveLocal } from "../../assets/js/common.js";
  import { ref, inject, onMounted } from 'vue';
  import { useRouter } from 'vue-router';
  
  const hs = ref([]);
  const axios = inject("axios");
  const router = useRouter();
  
  const back = () => {
	router.back();
  }
  
  const next = (h) => {
	let hospital = {
	  hpId: h.hpId,
	  name: h.name,
	  businesshours: h.businesshours,
	  deadline: h.deadline,
	  telephone: h.telephone,
	  address: h.address
	}
	saveLocal('hospital', hospital);
	router.push({ path: '/taocan' });
  }
  
  onMounted(() => {
	axios.get('/hospital/getAll')
	  .then((res) => {
		if (res.data && res.data.length) {
		  hs.value = res.data;
		  console.log("Data fetched successfully:", hs.value);
		} else {
		  alert("系统有误");
		}
	  })
	  .catch((error) => {
		console.error(error);
		alert("系统有误");
	  });
  });
  </script>
  
  <style scoped>
  #yuyue {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 14vw;
  }
  
  #yuyue > header {
	width: 100%;
	height: 8vh;
	background-color: #0097ff;
	display: flex;
	align-items: center;
	color: white;
  }
  
  #yuyue > header > div > img {
	width: 6vw;
  }
  
  #yuyue > header > p {
	font-size: 6vw;
	font-weight: bold;
	position: relative;
	left: 20vw;
  }
  
  #yuyue > .list {
	width: 94vw;
	height: 60vw;
	background-color: white;
	margin-top: 2vw;
	border-radius: 1vw;
	box-shadow: 2px 2px 6px grey;
	position: relative;
  }
  
  #yuyue > .list > p {
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
  
  #yuyue > .list > p > img {
	width: 8vw;
	height: 5vw;
	margin-right: 2vw;
  }
  
  #yuyue > .list > .content {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	color: grey;
  }
  
  #yuyue > .list > .content > div:nth-of-type(1) {
	width: 20vw;
  }
  
  #yuyue > .list > .content > div:nth-of-type(1) > img {
	width: 20vw;
	height: 18vw;
  }
  
  #yuyue > .list > .content > div:nth-of-type(2) {
	width: 72vw;
  }
  
  #yuyue > .list > .content > div:nth-of-type(2) > div {
	position: absolute;
	bottom: 2.3vw;
  }
  
  #yuyue > .list > .content > div:nth-of-type(2) > p {
	margin-bottom: 1vw;
	display: flex;
	justify-content: space-between;
  }
  
  #yuyue > .list > .content > div:nth-of-type(2) > p > span:nth-of-type(1) {
	flex: 7;
  }
  
  #yuyue > .list > .content > div:nth-of-type(2) > p > span:nth-of-type(2) {
	flex: 20;
  }
  </style>
  