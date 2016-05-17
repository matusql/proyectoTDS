<?php
	include  'conexion.php';
	
	$nombre = $_POST['txtnombre'];
	$apellido = $_POST['txtapellido'];
	$correo = $_POST['txtcorreo'];
	$pass = $_POST['txtpass'];
		
	$sql = "INSERT INTO tablita(nombre, apellido, correo, password) VALUES ('$nombre', '$apellido', '$correo', '$pass')";
	
	if($conexion->query($sql) === TRUE){
		echo '<script language="javascript"> 
					alert("Persona correctamente registrada");
					</script>';
	}else{
		echo "Error: ";
	}
?>