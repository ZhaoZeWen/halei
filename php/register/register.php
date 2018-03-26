<?php
header("Content-Type:application/json");
#1.连接到数据库
require("../init.php");
#2.接收前端传递过来的数据
@$uname=$_REQUEST["uname"];
@$upwd=$_REQUEST["upwd"];
@$email=$_REQUEST["email"];
@$phone=$_REQUEST["phone"];
@$user_name=$_REQUEST["user_name"];
@$gender=$_REQUEST["gender"];
#3.拼SQL语句
$sql="insert into hl_user(uname,upwd,email,phone,user_name,gender) values('$uname','$upwd','$email','$phone','$user_name',$gender)";
//echo $sql;
#4.执行插入数据
$result=mysqli_query($conn,$sql);
#5.根据操作结果给出响应
if($result==true){
	echo "注册成功";
}else{
	echo "注册失败";
}
?>