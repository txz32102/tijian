<template>
	<div id="index">
		<!-- 轮播图  -->
		<div class="lunbo">
			<img src="/banner/banner2.jpg">
		</div>
		<!-- 金刚区 -->
		<div class="jingang">
			<!-- 第一行 -->
			<div>
				<div class="left">
					<img src="/jingang/zixun.png">
					<div>
						<h3>免费咨询</h3>
						<p>新型病毒知识问答</p>
					</div>
				</div>
				<div class="right">
					<img src="/jingang/wenzhen.png">
					<div>
						<h3>网络问诊</h3>
						<p>图文网络咨询</p>
					</div>
				</div>
			</div>
			<!-- 第二行 -->
			<div>
				<div class="left">
					<img src="/jingang/menzhen.png">
					<div>
						<h3>e心门诊</h3>
						<p>复旦医科大学专家</p>
					</div>
				</div>
				<div class="right">
					<img src="/jingang/guanli.png">
					<div>
						<h3>慢病管理</h3>
						<p>血压血糖健康管理</p>
					</div>
				</div>
			</div>
			<!-- 第三行 -->
			<div>
				<div class="left">
					<img src="/jingang/huli.png">
					<div>
						<h3>上门护理</h3>
						<p>网上购买上门服务</p>
					</div>
				</div>
				<div class="right">
					<img src="/jingang/wenzhen.png">
					<div>
						<h3>团购预约</h3>
						<p>团体体检套餐定制</p>
					</div>
				</div>
			</div>
		</div>
		<!-- 我的报告 -->
		<div class="report">
			<h4>我的体检报告</h4>
			<div>
				<h4>&ensp;随时随地查看体检报告</h4>
				<el-button type="primary" @click="goFiles">立即查看</el-button>
			</div>
		</div>
		<!-- 推荐医生 -->
		<div class="doctor">
			<p>推荐医生</p>
			<!-- 医生信息 -->
			<div class="info">
				<div v-for="d in ds">
					<img :src="`/doctor/${d.img}`">
					<b v-text="d.name"></b>
					<p v-text="d.degree"></p>
				</div>
			</div>
		</div>
		<!-- 健康咨询列表,从后端读取后在此渲染 -->
		<div class="zixun" v-for="temp in arr">
			<!-- 生成咨询的列表信息 -->
			<!-- 加载图片 -->
			<img :src="temp.img">
			<div class="info">
				<!-- 动态加载 -->
				<h4 v-text="temp.title"></h4>
				<!-- 动态加载 -->
				<p v-text="temp.tips" class="tips"></p>
				<p>
					<img src="/more/zixun.png">
					<!-- 动态加载 -->
					<span v-text="temp.num"></span>
				</p>
			</div>
		</div>
		<!-- 导入底部导航组件 -->
		<Footer></Footer>
	</div>
</template>
<!-- 新语法 -->
<script setup>
	// 导入公共的组件,并嵌入到当前组件
	import Footer from '../common/Footer.vue';
	// 从基础vue中导入组件挂载时的方法,用于初始化页面中的数据
	// 导入动态数据加载工具,ref,reactive
	import {
		onMounted,
		ref,
		reactive
	} from 'vue';
	import {useRouter} from 'vue-router';
	const router=useRouter();
	// 动态存取咨询列表的数组
	var arr = ref([{
			img: '/list/ad1.jpg',
			title: '健康生活咨询1',
			tips: '日常生活方式1',
			num: 1889
		},
		{
			img: '/list/ad2.jpg',
			title: '健康生活咨询2',
			tips: '日常生活方式2',
			num: 9125
		},
		{
			img: '/list/ad1.jpg',
			title: '健康生活咨询3',
			tips: '日常生活方式3',
			num: 6528
		},
		{
			img: '/list/ad2.jpg',
			title: '健康生活咨询4',
			tips: '日常生活方式4',
			num: 2889
		},
		{
			img: '/list/ad1.jpg',
			title: '健康生活咨询5',
			tips: '日常生活方式5',
			num: 998
		}
	]);
	//动态数存医生信息:应该从后端取,这里模拟一下
	var ds = ref([{
			img: 'man1.png',
			name: '胡大帅',
			degree: '主任医师'
		},
		{
			img: 'man2.png',
			name: '李明',
			degree: '医生'
		},
		{
			img: 'man3.png',
			name: '钱真多',
			degree: '主任医师'
		},
		{
			img: 'man4.png',
			name: '赵小六',
			degree: '副主任医师'
		},
		{
			img: 'woman1.png',
			name: '张冬梅',
			degree: '主任医师'
		},
		{
			img: 'woman2.png',
			name: '李小美',
			degree: '医师'
		},
		{
			img: 'woman3.png',
			name: '高婷',
			degree: '主任医帅'
		},
		{
			img: 'woman4.png',
			name: '孙莉',
			degree: '主任医帅'
		}
	])
	//执行挂载组件的方法,从后端读取数据
	onMounted(() => {
		//暂时用到

	})
	////查看体检报告
	const goFiles=()=>{
		router.push({
			path:'/files'
		})
	}
</script>

<style scoped>
	#index {
	    width: 100%;
	    padding-bottom: 14vw;
	}
	
	
	#index>.lunbo {
	    width: 100%;
	    height: 25vh;
	    border-radius: 8px; 
	    box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2); 
	    overflow: hidden; 
	}
	
	#index>.lunbo>img {
	    width: 100%;
	    height: 25vh;
	    object-fit: cover; 
	}
	
	/* 金刚区 */
	#index>.jingang {
		width: 100%;
		height: 32vh;
		background-color: white;
		padding-top: 1vw;
	}
	#index {
    width: 100%;
    padding-bottom: 14vw;
}

/* 顶部的样式 */
#index>.lunbo {
    width: 100%;
    height: 25vh;
    border-radius: 8px; /* 添加圆角 */
    box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2); /* 添加阴影效果 */
    overflow: hidden; /* 确保圆角效果应用到图片上 */
}

#index>.lunbo>img {
    width: 100%;
    height: 25vh;
    object-fit: cover; /* 保持图片的宽高比，裁剪部分超出区域的内容 */
}

	#index>.jingang>div {
		width: 100%;
		height: 9.2vh;
		display: flex;
		/* 子元素水平排列 */
		flex-direction: row;
		/* 子元素两端分散对齐 */
		justify-content: space-between;
	}

	#index>.jingang>div:nth-of-type(2) {
		margin: 1.1vw 0;
		/* background-color: pink; */
	}

	/* 左右的样式 */
	#index>.jingang>div>div {
		height: 100%;
		width: 48vw;
		/* 灰色边框 */
		border: 1px solid #eee;
		/* 设置为弹性盒子 */
		display: flex;
		flex-direction: row;
		/* 水平左对齐 */
		justify-content: start;
		/* 图片与文本一起上下对齐 */
		align-items: center;
	}

	#index>.jingang>div>div>div>p {
		color: grey;
	}
	#index > .jingang {
	        width: 100%;
	        background-color: white;
	        padding-top: 4vw;
	        margin-top: 1vw; 
	        margin-bottom: 1vw; 
	    }
	#index > .jingang > div > div {
	        height: 100%;
	        width: calc(50% - 3vw); 
	        margin: 1vw; 
	        border-radius: 8px; 
	        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2); /* 利用box-shadow美化区域按钮 */
	    }
	
	#index > .jingang > div:nth-of-type(2) {
	        margin-top: 1vw; 
	    }
	/* 我的报告 */
	.report {
		width: 100%;
		height: 15vh;
		background-color: white;
		margin-top: 1.4vw;
	}

	.report>h4 {
		height: 4vh;
		line-height: 4vh;
		border-left: 4px solid #0097ff;
		padding-left: 2vw;
	}

	.report>div {
		height: 11vh;
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}

	/* 推荐医生 */
	#index>.doctor {
		width: 100%;
		height: 40vh;
		background-color: white;
		/* 上边距 */
		margin-top: 1vw;
		/* 下边距 */
		margin-bottom: 1vw;
	}

	#index>.doctor>p {
		font-weight: bold;
		font-size: 4.5vw;
		border-left: 4px solid #0097ff;
		padding-left: 2vw;
		margin-bottom: 3vw;
	}

	/* 医生列表 */
	#index>.doctor>.info {
		width: 100%;
		height: 36vh;
		display: flex;
		flex-direction: row;
		/* 一行太长,转行对齐 */
		justify-content: space-around;
		/* 转行后分散对齐 */
		flex-wrap:wrap;
	}

	#index>.doctor>.info>div {
		width: 20vw;
		height: 14vh;
		text-align: center;
	}

	#index>.doctor>.info>div>img {
		width: 18vw;
	}
	#index>.doctor>.info>div>b {
		color: grey;
		font-size: 4vw;
	}

	#index>.doctor>.info>div>p {
		color: grey;
		font-size: 3vw;
	}

	/* 健康咨询 */
	#index>.zixun {
		padding-top: 2vw;
		padding-bottom: 2vw;
		width: 100%;
		background-color: white;
		height: 20vw;
		display: flex;
		margin-bottom: 0.5vw;
		
		flex-direction: row;
		/* 子元素两端分散对齐 */
		justify-content: space-between;
	}

	/* 咨询图片 */
	#index>.zixun>img {
		width: 25vw;
	}

	/* 咨询内容 */
	#index>.zixun>.info {
		width: 70vw;
		
	}

	#index>.zixun>.info>p:nth-of-type(1) {
		color: grey;
	}

	#index>.zixun>.info>p:nth-of-type(2) {
		text-align: right;
		color: grey;
	}

	#index>.zixun>.info>p:nth-of-type(2)>img {
		width: 3.8vw;
		margin-right: 2vw;
		vertical-align: middle;
	}

	#index>.zixun>.info>p:nth-of-type(2)>span {
		margin-right: 4vw;
	}
	#index > .zixun {
	        padding-top: 2vw;
	        padding-bottom: 2vw;
	        width: 100%;
	        background-color: white;
	        height: 20vw;
	        display: flex;
	        margin-bottom: 0.5vw;
	        border-radius: 8px; 
	        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2); 
	    }
	#index > .doctor > .info > div > img {
	        width: 18vw;
	        
	        box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.2);
	        border-radius: 8px; 
	    }
</style>
