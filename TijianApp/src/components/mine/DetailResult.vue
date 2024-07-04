<template>
	<div id="detail-rs">
		<div class="normal" v-for="r in resultList">
			<h4>
				 {{r.checkItemName}}
			</h4>
			<div>
				<img :src="r.isError === 0 ? normalImageSrc : abnormalImageSrc">
				<h5>{{r.name}}</h5>
				<div>
					<p>{{r.value}}</p>
					<p>正常范围：{{r.normalValueString}}</p>
				</div>
			</div>
		</div>
	</div>
</template>

<script setup>
import {
		getLocal,
	} from "../../assets/js/common.js";
import { ref } from "vue";

const normalImageSrc = '/doctor/zhengchang.png';
const abnormalImageSrc = '/doctor/yichang.png';
const detailResult = getLocal("detailResult");
const resultList = ref(detailResult._value);
</script>

<style scoped>
	#detail-rs{
		width: 92%;
		margin-left:2vh;
	}
	#detail-rs>.normal{
		width: 100%;
		display: flex;
		flex-direction: column;
		margin-top: 2vw;
	}
	#detail-rs>.normal>h4{
		width: 100%;
		background-color: cornflowerblue;
		color: white;
		height: 2.7vh;
		border-radius: 10px 10px 0px 0px ;
		text-indent: 3vw;
		vertical-align: middle;
	}
	#detail-rs>.normal>div{ 
		background-color: white;
		border: 1px solid #eee;
		display: flex;
		flex-direction: row;
	}
	#detail-rs>.normal>div:nth-last-child(1){
		border-radius: 0px 0px 10px 10px ;
	}
	#detail-rs>.normal>div>img{
		width: 5%;
		height: 2vh;
		margin-top: 3vw;
		margin-left: 1vw;
	}
	#detail-rs>.normal>div>h5{
		margin-top: 3vw;
		margin-left: 1vw;
		width: 45%;
	}
	#detail-rs>.normal>div>div>p{
		color: grey;
	}
	#detail-rs>.normal{
		width: 100%;
		display: flex;
		flex-direction: column;
		
	}
	#detail-rs>.blood>h4{
		width: 100%;
		background-color: cornflowerblue;
		color: white;
		height: 2.7vh;
		border-radius: 10px 10px 0px 0px ;
		text-indent: 3vw;
		vertical-align: middle;
	}
	#detail-rs>.blood>div{ 
		background-color: white;
		border: 1px solid #eee;
		display: flex;
		flex-direction: row;
	}
	#detail-rs>.blood>div:nth-last-child(1){
		border-radius: 0px 0px 10px 10px ;
	}
	#detail-rs>.blood>div>img{
		width: 5%;
		height: 2vh;
		margin-top: 3vw;
		margin-left: 1vw;
	}
	#detail-rs>.blood>div>h5{
		margin-top: 3vw;
		margin-left: 1vw;
		width: 45%;
	}
	#detail-rs>.blood>div>div>p{
		color: grey;
	}
	#detail-rs>.blood{
		margin-top: 2vw;
	}
</style>