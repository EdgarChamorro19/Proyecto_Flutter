<?php
    include("conexion.php");

    $email = $_POST['Email'];
    
    $result=$mysqli->query("SELECT * FROM usuario WHERE Email = '".$email."'");

	$list = array();

	if($result){
		while($row = mysqli_fetch_assoc($result)){
		$list[]= $row;
		}
		echo json_encode($list);
	}

?>