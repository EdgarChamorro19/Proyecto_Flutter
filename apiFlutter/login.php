<?php 
	require_once("conexion.php");

	$email = $_POST['Email'];
	$password = $_POST['Password'];

	$sql = ("SELECT * FROM usuario WHERE Email = '".$email."' AND Password = '".$password."'");

	$result = mysqli_query($mysqli,$sql);

	$count = mysqli_num_rows($result);

	if ($count == 1) {
		echo json_encode("Success");

	}else{
		echo json_encode("Error");
	}

?>