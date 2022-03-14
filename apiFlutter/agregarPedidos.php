<?php
    require_once("conexion.php");

    $st_check=$mysqli->prepare("INSERT INTO pedidos(fecha, shipper, consigner, carrier, tracking, valorcompra, detalle, estado) VALUES (?,?,?,?,?,?,?,?)");
    $st_check->bind_param("ssssssss",$_POST['fecha'],$_POST['shipper'],$_POST['consigner'],$_POST['carrier'],$_POST['tracking'],$_POST['valorcompra'],$_POST['detalle'],$_POST['estado']);
    $st_check->execute();
    $rs=$st_check->get_result();
    
    if ($rs->num_rows==0) {
        echo"Incorrecto";
    }else{
        echo"correcto";
    }




?>