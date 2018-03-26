<?php
//php/cart/updateCount.php
require_once("../init.php");
@$iid=$_REQUEST["iid"];
@$count=$_REQUEST["count"];
if($iid!=null&&$count!=null){
	if($count==0)
		$sql="delete from hl_shoppingcart_item where iid=$iid";
	else
		$sql="update hl_shoppingcart_item set count=$count where iid=$iid";
	mysqli_query($conn,$sql);
}