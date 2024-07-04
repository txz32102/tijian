// 导入vue中的创建实例的对象
import {createApp} from 'vue'
// 导入全局组件文件,并取的一个别名 
import App from './App.vue'
//导入路由配置
import router from './router';
//全局导入element-plus 
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
//路由守护:用户未登录不允许更多的操作
router.beforeEach(function(to,from,next){//路由前置守护
    //从全局缓存中获取用户的id号
	let userId = localStorage.getItem('userId');
	//除了登录、注册、首页、商家列表、商家信息之外，都需要判断是否登录
	if(!(to.path=='/'||to.path=='/index'||to.path=='/register'||to.path=='/login'||to.path=='/mine')){
		if(userId==null){
			//如果用户没有登录则直接跳到登录页
			router.push('/login');
		}
	}
	//如果请求路径（接口）是允许(合法)的，则继续往后执行
	next();
});
//创建vue的实例对象,实现页面跳转,并进行更多的操作
const app=createApp(App);
//使用实例对象来装载路由对象
app.use(router);
//最后将app挂载到index.html容器中的#app上
app.mount('#app');
