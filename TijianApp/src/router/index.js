//1.导入路由工具
import {
	createRouter,
	createWebHistory
} from 'vue-router'
//2.导入各个需要设置路径组件
import Index from '../components/index/Index.vue';
import Yuyue from '../components/yuyue/Yuyue.vue';
import ConfirmBill from '../components/bill/ConfirmBill.vue';
import BillList from '../components/bill/BillList.vue';
import BillOk from '../components/bill/BillOk.vue';
import Mine from '../components/mine/Mine.vue';
import Files from '../components/mine/Files.vue';
import TotalResult from '../components/mine/TotalResult.vue';
import DetailResult from '../components/mine/DetailResult.vue';
import TijianReport from '../components/mine/TijianReport.vue';
import Login from '../components/user/Login.vue';
import Register from '../components/user/Register.vue';
import SelectTaocan from '../components/yuyue/SelectTaocan.vue'
import SelectDate from '../components/yuyue/SelectDate.vue'

//3.创建一个数组,给组件设置跳转的路径
const routes = [
	// 必须配置根路由,默认自动调用并显存的,否则报错
	{ //重定向到主页
		path: '/',
		redirect: '/index'
	},
	{ //首页路由
		path: '/index',
		name: 'Index',
		component: Index
	},
	{
		path: '/yuyue',
		name: 'Yuyue',
		component: Yuyue
	},
	{
		path: '/taocan',
		name: 'SelectTaocan',
		component: SelectTaocan
	},
	{
		path: '/date',
		name: 'SelectDate',
		component: SelectDate
	},
	{
		path: '/confirmbill',
		name: 'ConfirmBill',
		component: ConfirmBill
	},
	{
		path: '/billlist',
		name: 'BillList',
		component: BillList
	},
	{
		path: '/billok',
		name: 'BillOk',
		component: BillOk
	},
	{
		path: '/mine',
		name: 'Mine',
		component: Mine
	},
	{
		path: '/login',
		name: 'Login',
		component: Login
	},
	{
		path: '/register',
		name: 'Register',
		component: Register
	},
	{
		path: '/files',
		name: 'Files',
		component: Files
	},
	{
		path: '/tijian',
		name: 'TijianReport',
		component: TijianReport,
		redirect:'/totalresult',
		children:[
			{
				path: '/totalresult',
				name: 'TotalResult',
				component: TotalResult
			},
			{
				path: '/detailresult',
				name: 'DetailResult',
				component: DetailResult
			}
		]
	}
]
//4.创建路由对象
const router = createRouter({
	history: createWebHistory(),
	routes: routes
})
//5.导出自定义路由对象
export default router;