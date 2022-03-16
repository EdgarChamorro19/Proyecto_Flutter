<?php
    require_once("conexion.php");

    $st_check=$mysqli->prepare("INSERT INTO pedidos(fecha, shipper, consigner, carrier, tracking, valorcompra, detalle, estado, CedUsuario) VALUES (?,?,?,?,?,?,?,?,?)");
    $st_check->bind_param("sssssssss",$_POST['fecha'],$_POST['shipper'],$_POST['consigner'],$_POST['carrier'],$_POST['tracking'],$_POST['valorcompra'],$_POST['detalle'],$_POST['estado'],$_POST['CedUsuario']);
    $st_check->execute();
    $rs=$st_check->get_result();
    
    if ($rs->num_rows==0) {
        echo json_encode("Incorrecto");
    }else{
        echo json_encode("correcto");
    }

?>