<?php
//php/cart/deleteItem.php
require_once("../init.php");
@$iid=$_REQUEST["iid"];
$sql="delete from hl_shoppingcart_item where iid=$iid";
mysqli_query($conn,$sql);