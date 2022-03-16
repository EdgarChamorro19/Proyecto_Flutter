<?php

  include('conexion.php');

  $cedula = $_POST['Cedula'];

  $result=$mysqli->query("SELECT p.id, p.fecha,p.shipper,p.consigner,p.carrier,p.tracking,p.valorcompra,
                          p.detalle,p.estado FROM pedidos p INNER JOIN usuario u on p.CedUsuario = u.Cedula 
                          WHERE u.Cedula = '".$cedula."' ");

  $list = array();

  if($result){
    while($row = mysqli_fetch_assoc($result)){
      $list[]= $row;
    }
    echo json_encode($list);
  }

?>