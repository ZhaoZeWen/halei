<?php
//php/cart/getCart.php
header("Content-Type:application/json");
require_once("../init.php");
session_start();
@$uid=$_SESSION["uid"];
$sql="select iid,lid,(select sm from hl_laptop_pic where lid=fid limit 1) as sm,title,type,count,price,is_checked from hl_shoppingcart_item inner join hl_laptop on lid=lid where uid=$uid";
$result=mysqli_query($conn,$sql);
echo json_encode(mysqli_fetch_all($result,1));