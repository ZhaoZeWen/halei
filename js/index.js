/*$(()=>{
	function task(){
				var show=
					document.querySelector(".banner .show");
				show.className="";
				if(show.nextElementSibling!=null){
					show.nextElementSibling.className="show";
				}else{
					show.parentNode.children[0].className="show";
				}
			}
			var timer=setInterval(task,3000)
			var banner = document.querySelector(".banner");
			banner.onmouseover=function(){
				clearInterval(timer);
				this.timer=null;
			}
				banner.onmouseout=function(){
				timer=setInterval(task,3000)
			}

			var imgs=document.querySelectorAll(
				".banner img"
			);
			for(var img of imgs){
				img.onclick=function(){
					alert(this.alt);
				}
			}
})*/
/******************************************************************************/
//图片轮播
$(()=>{
	var distance=1000,moved=0,timer=null,duration=300,wait=3000;
	//console.log(1);断点找错
	$.get("php/index/getCarousel.php").then(data=>{
		//console.log(data);//断点找错
		var html="";
		//动态加载banner部分
		for(var p of data){
			html+=`<li>
				<a href="${p.href}" title="${p.title}">
					<img src="${p.img}">
				</a>
			</li>`
		}
			//在末尾将第一张图片多加载一次
			var p0=data[0];
			html+=`<li>
				<a href="${p0.href}" title="${p0.title}">
					<img src="${p0.img}">
				</a>
			</li>`
			var $ban=$("#banner");
			$ban.html(html).css("width",distance*(data.length+1));
			var $ind=$("#indicators");
			$ind.html("<li></li>".repeat(data.length))
							.children().first().addClass("hover");
				//console.log(html);//断点找错
			//单张图片的动画函数
			function move(){
				$ban.animate({
					left:-distance*moved
				},duration,function(){
						if(moved==5){
							moved=0;
							$ban.css("left",0);
						}
						$ind.children(`:eq(${moved})`).addClass("hover")
						.siblings().removeClass("hover");
					})
			};
			//定时器，轮播
			timer=setInterval(()=>{
				moved++;
				move();
			},duration+wait);
			//左右点击切换图片
			$("#arrow-left").click(()=>{
				if(!$ban.is(":animated")){
					if(moved==0){
						moved=5;
						$ban.css("left",-distance*moved);
					}
					moved--;
					move();
				}
			});
			$("#arrow-right").click(()=>{
				if(!$ban.is(":animated")){
					moved++;
					move();	
				}
			});
			//小圆点自动随图片切换而变色
			
			$ind.on("mouseover","li",e=>{
				moved=$(e.target).index();
				//防动画叠加
				$ban.stop(true);
				move();
			});
			//防动画、定时器叠加
			$ban.hover(
				//鼠标悬停
				()=>clearInterval(timer),
				//鼠标移开banner图
				()=>timer=setInterval(()=>{
					moved++;
					move();
				},duration+wait)
			)
	})
});

/*****************************************************************************/
//加载第二块
$(()=>{
	$.get("php/index/getFloor1.php").then(result=>{
		var data=result;
		var html="";
			for(var p of data){
				html+=`<ul class="imgs">
						<li>
							<div><a href="${p.href}"><img src="${p.pic}"></a></div>
							<div><h2><p>骑最帅的车.日最爱的妞</p></h2></div>
							<div>
								<h3><p>${p.title}</p></h3>
								<p>￥${p.price}</p>
							
							</div>
						</li>
						<li>
						 <div><a href="${p.href}"><img src="${p.pic}"></a></div>
							<div><h2><p>骑最帅的车.日最爱的妞</p></h2></div>
							<div>
								<h3><p>${p.title}</p></h3>
								<p>￥${p.price}</p>
							</div>
						</li>
						<li>
							<div><a href="${p.href}"><img src="${p.pic}"></a></div>
							<div><h2><p>骑最帅的车.日最爱的妞</p></h2></div>
							<div>
								<h3><p>${p.title}</p></h3>
								<p>￥${p.price}</p>
							</div>
						</li>
					</ul>`
		}
				document.querySelector(".second")
								.innerHTML=html;
	})
});

/********************************************************************************************/
//加载第五块
$(()=>{
	$.get("php/index/getFloor2.php").then(result=>{
		var data=result;
		var html="";
		for(var p of data){
			html+=`<ul>
						<li>
							<div><img src="${p.pic}"></div>
							<div>
								<p>${p.title}</p>
								<p>￥${p.price}</p>
							</div>		
						</li>
						<li>
							<div><img src="${p.pic}"></div>
							<div>
								<p>${p.title}</p>
								<p>￥16998.00</p>
							</div>		
						</li>
						<li>
							<div><img src="${p.pic}"></div>
							<div>
								<p>${p.title}</p>
								<p>￥${p.price}</p>
							</div>
						</li>
					</ul>`
		}
								document.querySelector(".fivth")
									.innerHTML=html;
	})
});
/**************************************************************************************************/
//楼层滚动
$(()=>{
	$(window).scroll(()=>{
		var scrollTop=document.documentElement.scrollTop
								||document.body.scrollTop;
		var offsetTop=$(".floor:first").offset().top;
		if(offsetTop<=scrollTop+innerHeight/2){
			$("#lift").show();
		}else{
			$("#lift").hide();
		}
		var $floors=$(".floor");
		for(var i=0;i<$floors.length;i++){
			var $f=$($floors[i]);
			if($f.offset().top>scrollTop+innerHeight/2){
				break;
			}
		}
		$(`#lift>ul>li:eq(${i-1})`)
			.addClass("lift_item_on")
			.siblings().removeClass("lift_item_on")
	})
	$("#lift>ul").on("click","a.lift_btn",function(){
			var $a=$(this);
			var i=$a.parent().index();
			var offsetTop=$(`.floor:eq(${i})`).offset().top;
			$(document.body).stop(true).animate({
				scrollTop:offsetTop-50
			},500)
		})
})