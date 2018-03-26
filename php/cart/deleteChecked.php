<?php
//php/cart/deleteChecked.php
require_once("../init.php");
session_start();
@$uid=$_SESSION["uid"];
$sql="delete from hl_shoppingcart_item where uid=$uid and is_checked=1";
mysqli_query($conn,$sql);