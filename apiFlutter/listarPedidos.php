<?php

  include('conexion.php');

  $result=$mysqli->query("SELECT * FROM pedidos ");

  $list = array();

  if($result){
    while($row = mysqli_fetch_assoc($result)){
      $list[]= $row;
    }
    echo json_encode($list);
  }

?>