<?php
	include  'conexion.php';
	
	$sql="SELECT * from tablita where 1";
	if($result=$conexion->query($sql)){
		if($result->num_rows>0){
			while($row=$result->fetch_array()){
				echo "".$row["nombre"]." ".$row["apellido"]."<br>";
			}
		}else{
			echo "tabla vacia";
		}
	}
?>