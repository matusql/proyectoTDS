function cargar(){ //INICIAR SESION
	var correo=document.getElementById("txtcorreo").value;
	var pass=document.getElementById("txtpass").value;
	var parametros = { //para llamar a ajax
			"txtcorreo" : correo,
			"txtpass" : pass,
 	};
	$.ajax({
			data:  parametros,
			url:   'manejoformulario.php',
			type:  'post',
			beforeSend: function () {
					$("#body").html("Procesando, espere por favor...");
			},
			success:  function (response) {
					$("#body").html(response);
			}
	});
}

function verificar(){ //REGISTRARSE
	var nombre=document.getElementById("newnombre").value;
	var apellido=document.getElementById("newapellido").value;
	var correo=document.getElementById("newcorreo").value;
	var pass=document.getElementById("newpass").value;
	
	var resp1 = validarEmail(correo);
	var resp2 = validarPass(pass);
	
	if(resp1==1 && resp2==1){
		registro(nombre,apellido,correo,pass);
	}
}

function validarEmail(correo){
	 if (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(correo)){
		alert("La dirección de email " + correo + " es correcta");
		return 1;
	}else{
		alert("La dirección de email es incorrecta.");
		return 0;
	}
}

function validarPass(pass){
	var letras="abcdefghijklmnñopqrstuvwxyz";
	var num="0123456789";
	var con_l=0;
	var con_n=0;
	pass=pass.toLowerCase();
	
	if(pass.length <= 5){
		alert("Faltan caracteres");
		return 0;
	}else if(pass.length >= 12){
		alert("Numero de cararacteres exedidos");
		return 0;
	}else{
		for(i=0; i< pass.length; i++){
			if(letras.indexOf(pass.charAt(i),0)!=-1){
				con_l ++;
				//break;
			}
		}
		if(con_l==0){
			alert("Debe haber al menos una letra en la contraseña");
			return 0;
		}
		for(j=0; j< pass.length; j++){
			if(num.indexOf(pass.charAt(j),0)!=-1){
				con_n ++;
				//break;
			}
		}
		if(con_n <=2){
			alert("Deben haber al menos 3 numeros en la contraseña");
			return 0;
		}
		return 1;
	}
}

function registro(nombre,apellido,correo,pass){
	
	var parametros = { //para llamar a ajax
			"txtnombre" : nombre,
			"txtapellido" : apellido,
			"txtcorreo" : correo,
			"txtpass" : pass,
 	};
	$.ajax({
			data:  parametros,
			url:   'registrar.php',
			type:  'post',
			beforeSend: function () {
					$("#body").html("Procesando, espere por favor...");
			},
			success:  function (response) {
					$("#body").html(response);
			}
	});
}