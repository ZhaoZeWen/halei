<?php
//php/cart/clearCart.php
require_once("../init.php");
session_start();
@$uid=$_SESSION["uid"];
$sql="delete from hl_shoppingcart_item where uid=$uid";
mysqli_query($conn,$sql);