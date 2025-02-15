
	function removeTarefa(idTarefa){

		document.getElementById("idRemovido").value = idTarefa;
		if (confirm("Confirmar exclusão da tarefa?") == true) {
			document.getElementById("formulario_remocao").submit();
		}

	}

	function editarTarefa(idTarefa,tituloTarefa,descricaoTarefa,dataTarefa){
		document.getElementById("idEditado").value = idTarefa;
		document.getElementById("tituloEditado").value = tituloTarefa;
		document.getElementById("descricaoEditado").value = descricaoTarefa;
		document.getElementById("dataEditado").value = dataTarefa;

		if (confirm("Ir para a página de edição da tarefa?") == true) {
			document.getElementById("formulario_edicao").submit();
		}
	}


	function desabilitarDatasPassadas() {
  		var hoje = new Date();
  		var dia = String(hoje.getDate()).padStart(2, '0');
  		var mes = String(hoje.getMonth() + 1).padStart(2, '0');
  		var ano = hoje.getFullYear();

  		hoje = ano + '-' + mes + '-' + dia;
  document.getElementById("dataDeVencimentoDaTarefa").setAttribute("min", hoje);
}
