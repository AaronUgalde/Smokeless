const formularioregistro = document.getElementById('formularioregistro');
const inputs = document.querySelectorAll('#formularioregistro input');

const expresiones = {
	name: /^[a-zA-Z0-9\_\-]{2,45}$/,
	contra: /^[a-zA-ZÀ-ÿ\s]{2,45}$/,
	nacimiento: /^([012][1-9]|3[01])(\/)(0[1-9]|1[012])\2(\d{4})$/,
	sexo: /^[MFO]$/,
	edad: /^\d{1,2}$/
}

const campos = {
	name: false,
	contra: false,
	nacimiento: false,
	sexo: false,
	edad: false
}

const validarformularioregistro = (e) => {
	switch (e.target.name) {
		case "name":
			validarCampo(expresiones.name, e.target, 'name');
		break;
		case "contra":
			validarCampo(expresiones.contra, e.target, 'contra');
		break;
		case "nacimiento":
			validarCampo(expresiones.nacimiento, e.target, 'nacimiento');
		break;
		case "sexo":
			validarCampo(expresiones.sexo, e.target, 'sexo');
		break;
		case "edad":
			validarCampo(expresiones.edad, e.target, 'edad');
		break;
	}
}

const validarCampo = (expresion, input, campo) => {
	if(expresion.test(input.value)){
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-check-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-times-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.remove('formulario__input-error-activo');
		campos[campo] = true;
	} else {
		document.getElementById(`grupo__${campo}`).classList.add('formulario__grupo-incorrecto');
		document.getElementById(`grupo__${campo}`).classList.remove('formulario__grupo-correcto');
		document.querySelector(`#grupo__${campo} i`).classList.add('fa-times-circle');
		document.querySelector(`#grupo__${campo} i`).classList.remove('fa-check-circle');
		document.querySelector(`#grupo__${campo} .formulario__input-error`).classList.add('formulario__input-error-activo');
		campos[campo] = false;
	}
}

inputs.forEach((input) => {
	input.addEventListener('keyup', validarformularioregistro);
	input.addEventListener('blur', validarformularioregistro);
});

formularioregistro.addEventListener('submit', (e) => {
	

	if(campos.name && campos.contra && campos.nacimiento && campos.sexo && campos.edad){
		formularioregistro.reset();

		document.getElementById('formulario__mensaje-exito').classList.add('formulario__mensaje-exito-activo');
		setTimeout(() => {
			document.getElementById('formulario__mensaje-exito').classList.remove('formulario__mensaje-exito-activo');
		}, 5000);

		document.querySelectorAll('.formulario__grupo-correcto').forEach((icono) => {
			icono.classList.remove('formulario__grupo-correcto');
		});
	} else {
		document.getElementById('formulario__mensaje').classList.add('formulario__mensaje-activo');
	}
});