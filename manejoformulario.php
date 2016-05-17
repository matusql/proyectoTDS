<?php
	include  'conexion.php';
	
	$correo=$_POST['txtcorreo'];
	$pass=$_POST['txtpass'];
	
	$sql="SELECT nombre, apellido, password FROM tablita where correo='$correo'";
	$result = $conexion->query($sql);

	if ($result->num_rows > 0){
		while($row = mysqli_fetch_array($result, MYSQL_ASSOC)) {
			if($row['password']==$pass){
				echo "Conectado";
			}
			else{
				echo "Contraseña invalida";
			}
		}
	}else{
		echo "Usuario NO registrado";
	}
?>