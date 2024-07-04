<template>
	<!-- 总检结论内容 -->
	<div id="total-rs">
		<div class="abnormal">
			<h4>
				 异常项
			</h4>
			<div v-for="r in resultList">
				<div v-if="r.isError===1">
				<img :src="r.isError === 0 ? normalImageSrc : abnormalImageSrc">
				<h5>{{r.name}}</h5>
				<div>
					<p>{{r.value}}</p>
					<p>正常范围：{{r.normalValueString}}</p>
				</div>
			</div>
			</div>
		</div>
		<div class="advice">
			<h4>
				尊敬的顾客，您本次体检建议信息如下：
			</h4>
			<div>
				<p>{{content.content}}</p>
			</div>
		</div>
	</div>
</template>

<script setup>
import {
		getLocal,
	} from "../../assets/js/common.js";
import { ref,inject } from "vue";

const normalImageSrc = '/doctor/zhengchang.png';
const abnormalImageSrc = '/doctor/yichang.png';
const detailResult = getLocal("detailResult");
const resultList = ref(detailResult._value);



const totalResult = getLocal("totalResult");
const content = ref(totalResult._value);
</script>

<style scoped>
	#total-rs{
		width: 92%;
		margin-left:2vh;
	}
	#total-rs>.abnormal{
		width: 100%;
		display: flex;
		flex-direction: column;
		margin-top: 2vw;
	}
	#total-rs>.abnormal>h4{
		width: 100%;
		background-color: cornflowerblue;
		color: white;
		height: 2.7vh;
		border-radius: 10px 10px 5px 5px ;
		text-indent: 3vw;
		vertical-align: middle;
	}
	#total-rs>.abnormal>div>div{ 
		background-color: white;
		border: 1px solid #eee;
		display: flex;
		flex-direction: row;
	}
	#total-rs>.abnormal>div>div:nth-last-child(1){
		border-radius: 10px 10px 10px 10px ;
	}
	#total-rs>.abnormal>div>div>img{
		width: 5%;
		height: 2vh;
		margin-top: 5vw;
		margin-left: 3vw;
	}
	#total-rs>.abnormal>div>div>h5{
		margin-top: 5vw;
		margin-left: 3vw;
		width: 45%;
	}
	#total-rs>.abnormal>div>div>div>p{
		color: grey;
	}
	#total-rs>.advice>h4{
		width: 100%;
		background-color: cornflowerblue;
		color: white;
		height: 2.7vh;
		border-radius: 10px 10px 0px 0px ;
		text-indent: 3vw;
		vertical-align: middle;
	}
	#total-rs>.advice>div{
		width: 100%;
		background-color: white;
		border: 1px solid #eee;
		display: flex;
		flex-direction: column;
	}
	#total-rs>.advice>div>div>h5{
		margin-top: 3vw;
		margin-left: 1vw;
		width: 100%;
		align-self: auto;
		color: #222;
	}
	#total-rs>.advice>div>p{
		margin-top: 3vw;
		width: 100%;
		background-color: white;
		align-self: auto;
		text-indent: 2em;
		color: #444;
	}
	
	#total-rs>.advice{
		margin-top: 2vw;
	}
	
</style>