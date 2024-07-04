<!-- 模板标签,包含的是网页标签,也可以是其它前端框架的标签-->
<template>
	<!-- 最外层只能有一个div -->
	<div id="wrap">
		<!-- 加载其它组件中的内容 -->
		<router-view></router-view>
	</div>
</template>
<!--ts新的语法糖-->
<script setup>
	import { provide } from "vue";
	//导入vue的ajax对象,实现异步请求功能
	import axios from 'axios';
	//全局设置axios的基础url部分,如果部署到centos这里localhost要修改为ip地址
	axios.defaults.baseURL = 'http://localhost:9080/';
	//以键-值对方式,设置一个全局缓存对象,其它组件通过inject()方法导入
	provide('axios', axios);
</script>
<!-- 当前页的样式,scoped让样式只影响当前页 -->
<style scoped>
	#wrap {
		/* 高度不设,让内容去撑 */
		width: 100%;
		/* 将元素设置为边框盒子,防止内间距撑大*/
		box-sizing: border-box;
		/* background-color: pink; */
	}
</style>