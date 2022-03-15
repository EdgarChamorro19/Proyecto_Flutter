<?php
    require_once("conexion.php");
	
	$cedula= $_POST['Cedula'];
	$email = $_POST['Email'];
	
	$sql= "SELECT * FROM usuario WHERE Cedula='".$cedula."' OR Email='".$email."'";
	$r=mysqli_query($mysqli,$sql);
	
	if ($r->num_rows > 0){
		echo "Usuario ya Registrado";
	}else{
		$st_check=$mysqli->prepare("INSERT INTO usuario(Cedula,Nombre,Apellido,Email,Password,Rol) VALUES (?,?,?,?,?,?)");
		$st_check->bind_param("ssssss",$_POST['Cedula'],$_POST['Nombre'],$_POST['Apellido'],$_POST['Email'],$_POST['Password'],$_POST['Rol']);
		$st_check->execute();
		$rs=$st_check->get_result();
		
		if ($rs->num_rows==0) {
			echo json_encode("Incorrecto");
		}else{
			echo json_encode("correcto");
		}
	}
?>