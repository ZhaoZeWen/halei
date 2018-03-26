<?php
//php/cart/checkAll.php
require_once("../init.php");
session_start();
@$uid=$_SESSION["uid"];
@$check_all=$_REQUEST["check_all"];
$sql="update hl_shoppingcart_item set is_checked=$check_all where uid=$uid";
mysqli_query($conn,$sql);