<?php
//响应头
	header("Content-Type:application/json");
	require_once("../init.php");
	$sql="select * from hl_index_carousel";
	$result=mysqli_query($conn,$sql);
	echo json_encode(mysqli_fetch_all($result,1));
	