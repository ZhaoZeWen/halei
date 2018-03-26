function ajax({type,url,data,dataType}){
			 return new Promise(callback=>{
			var xhr=new XMLHttpRequest();//1.创建xhr对象:
			//如果type是get，且data不为空，才+?+data
			if(type.toLowerCase()=="get"&&data!==undefined)
				url+="?"+data;
			xhr.open(type,url,true)//2.创建请求
			//3.设置回调函数-onreadystatechange
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4){
					if(xhr.status==200){
						var resData=xhr.responseText;//接收响应结果字符串
						if(dataType!==undefined//如果响应消息的类型是json
							&&dataType.toLowerCase()=="json"){
						 resData=JSON.parse(resData);
						}
						callback(resData);
					}
				}
			}
			if(type.toLowerCase()==="post")//如果是post
				xhr.setRequestHeader(//才增加：更改请求消息头
					"Content-Type","application/x-www-form-urlencoded"
				);
				//发送请求
			xhr.send(type.toLowerCase()=="get"?null:data);
		})
	 }
		