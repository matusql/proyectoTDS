<?php
	$servidor = "localhost";
	$user = "root";
	$pass = "";
	$db = "ayudantia";
	
	$conexion= new mysqli($servidor, $user, $pass, $db);
	
	mysqli_set_charset($conexion, "utf8");

	if ($conexion->connect_error){
		die("Connection failed: " . $conexion->connect_error);
	} 
	else{
		#echo "Conexión exitosa !";
		#echo "<br>";
	}
	
?>