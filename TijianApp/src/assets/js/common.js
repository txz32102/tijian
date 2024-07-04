//////以下为公共的功能/////
export function getDateStr(date){
	//2024年6月28日
	//let date = new Date();
	let year=date.getFullYear();//年
	let month = date.getMonth()+1;//月
	let dd=date.getDate();//日
	return year+'年'+month+'月'+dd+'日';
}
export function getDate(date){
	//yyyy-mm-dd,用于存入数据库中
	let year=date.getFullYear();//年
	let month = date.getMonth()+1;//月
	let dd=date.getDate();//日
	return year+'-'+month+'-'+dd;
}
//以上为h5的缓存的管理//
//localStorage(永久存取),sessionStorage(临时存取)
export function saveLocal(k,v){
	//一定要将对象转为json格式字符串存入
	//之后取出就可以转成js对象
	let temp=JSON.stringify(v);
	localStorage.setItem(k,temp);
}
export function getLocal(k){
	let v=localStorage.getItem(k);
    if (v == '' || v == null || v == 'null' || v == undefined) {
        return null;
    } else {//将字符串转成json对象,方便之后处理
        return JSON.parse(v);
    }
}
export function delLocal(k){
	localStorage.removeItem(k);
}

export function saveSession(k,v){
	//一定要将对象转为json格式字符串存入
	let temp=JSON.stringify(v);
	sessionStorage.setItem(k,temp);
}
export function getSession(k){
	let v=sessionStorage.getItem(k);
	if (v == '' || v == null || v == 'null' || v == undefined) {
	    return null;
	} else {//将字符串转成json对象,方便之后处理
	    return JSON.parse(v);
	}
}
export function delSession(k){
	sessionStorage.removeItem(k);
}