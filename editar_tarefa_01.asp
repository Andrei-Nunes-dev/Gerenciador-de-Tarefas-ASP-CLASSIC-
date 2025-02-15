<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Editor de Tarefas</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="Estilos/estilos.css">
	<script src="Funções/funcoes.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<%				
						'Resgata os dados passados pelo formulário'
						idDaTarefa = Cint(Request.Form("idEditado"))
						tituloDaTarefa = CStr(Request.Form("tituloEditado"))
					 	descricaoDaTarefa = CStr(Request.Form("descricaoEditado"))
						dataDeVencimentoDaTarefa = Request.Form("dataEditado")

						
						tamanhotituloDaTarefa = len(tituloDaTarefa)
						tamanhodescricaoDaTarefa = len(descricaoDaTarefa)
%>

<body style="background-color: #099FFC; font-family:'Times New Roman', serif; ">

	<header style="background-color:#ecf0f6;">
		<h1 align="center" style = "text-decoration: underline;"><i class="fa fa-pencil-square-o" style="font-size:40px;"></i>Editor de Tarefa</h1>
	</header>
	<% if (tamanhotituloDaTarefa = 0) or (tamanhodescricaoDaTarefa = 0) then %>
	<div class="container text-center" style="background-color: #ecf0f6; border-radius: 25px;">
			<div class="row" style="padding: 7px;">
				<div class="col"></div>
				<div class="col-9">
					<div class="error">Campos de edição vazios, retorne a página inicial</div>
					<a class="btn btn-primary" href="/ToDoList_Avine_ASP" role="button">Voltar para página principal</a>
				</div>
				<div class="col"></div>
			</div>
	</div>
	<% else %>		
	<div class="container" style="background-color: #ecf0f6; border-radius: 25px;">
		<div class="row" style="padding: 7px;">
			<div class="col"></div>
			<div class="col-6" style ="box-shadow: 5px 10px 10px black; border:solid 1px; background-color: white;border-radius: 25px;">
				<form method = "post" action="editar_tarefa_02.asp" id = "formulario_edicao_02">
					
					<div class="mb-3">
						<label for="tituloDaTarefa" class="form-label">Título da tarefa</label>
						<div class="input-group">
						  <input type="text" class="form-control" style="border:solid 1px;" name="tituloDaTarefa" id="tituloDaTarefa" value = "<% Response.write tituloDaTarefa %>" required>
						</div>
					</div>

					<div class="mb-3">
						<label for="descricaoDaTarefa" class="form-label">Descrição da tarefa</label>
						<div class="input-group">
					 	 <textarea class="form-control" name="descricaoDaTarefa" id="descricaoDaTarefa" style="border:solid 1px;" form="formulario_edicao_02" required><% Response.write descricaoDaTarefa %></textarea>
						</div>
					</div>

					<div class="mb-3">
						<label for="dataDeVencimentoDaTarefa" class="form-label">Data de vencimento da tarefa</label>
						<div class="input-group">
						  <input type="date" class="form-control" style="border:solid 1px;" onFocus = "desabilitarDatasPassadas()" value = "<% Response.write dataDeVencimentoDaTarefa %>" name="dataDeVencimentoDaTarefa" id="dataDeVencimentoDaTarefa" required>
						</div>
					</div>
					<div class="d-flex justify-content-between">
					      <div>
					      <a class="btn btn-warning" href="/ToDoList_Avine_ASP" role="button" style = "margin:10px;" >Voltar para página principal</a>
					      </div>
					      <div class="ml-auto">
					         <input class="btn btn-primary"  type="submit" name="submit" style = "margin:10px;" value = "Salvar edição">
					      </div>
					 </div>
					 <input type="hidden" id="idDaTarefa" name="idDaTarefa" value="<% Response.write idDaTarefa %>" />
				</form>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<% end if %>	
</body>

</html>		