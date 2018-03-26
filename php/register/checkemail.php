<?php
require("../init.php");
@$uname=$_REQUEST["uname"];
$sql="select * from halei where uname='$uname'";
$result=mysqli_query($conn,$sql);
if($result==null){
	echo "通过";
}else{
	echo "用户已存在";

}
?>