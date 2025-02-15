<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gerenciador de Tarefas</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="Estilos/estilos.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<script src="Funções/funcoes.js"></script>


<body style="background-color: #099FFC; font-family:'Times New Roman', serif; ">

	<header style="background-color:#ecf0f6;">
		<h1 align="center" style = "text-decoration: underline;"><i class="fa fa-pencil-square-o" style="font-size:40px;"></i>Gerenciador de Tarefas (To-do List)</h1>
	</header>

	<div class="container" style="background-color: #ecf0f6; border-radius: 25px;">
		<div class="row" style="padding: 7px;">
			<div class="col"></div>
			<div class="col-6" style ="box-shadow: 5px 10px 10px black; border:solid 1px; background-color: white;border-radius: 25px;">
				<h3 align="center">Adicione uma nova tarefa</h3>
				<form method = "post" action="insere_tarefa.asp" id = "formulario_insercao">
					
					<div class="mb-3">
						<label for="tituloDaTarefa" class="form-label">Título da tarefa</label>
						<div class="input-group">
						  <input type="text" class="form-control" name="tituloDaTarefa" style="border:solid 1px;" id="tituloDaTarefa" placeholder="Título da tarefa" required>
						</div>
					</div>

					<div class="mb-3">
						<label for="descricaoDaTarefa" class="form-label">Descrição da tarefa</label>
						<div class="input-group">
					 	 <textarea class="form-control" name="descricaoDaTarefa" style="border:solid 1px;" id="descricaoDaTarefa"  placeholder="Descrição da tarefa" form="formulario_insercao" required></textarea>
						</div>
					</div>

					<div class="mb-3">
						<label for="dataDeVencimentoDaTarefa" class="form-label">Data de vencimento da tarefa</label>
						<div class="input-group">
						  <input type="date" class="form-control" style="border:solid 1px;" onFocus = "desabilitarDatasPassadas()" name="dataDeVencimentoDaTarefa" id="dataDeVencimentoDaTarefa" required>
						</div>
					</div>
					<div class="d-flex justify-content-between">
					      <div></div>
					      <div class="ml-auto">
					         <input class="btn btn-primary"  type="submit" name="submit" value = "Adicionar tarefa" style = "margin:10px;">
					      </div>
					 </div>
				</form>
			</div>
			<div class="col"></div>
		</div>
		<%
		On Error Resume Next
		Dim conexao
		Set conexao = Server.CreateObject("ADODB.Connection")
		Set recordSet = Server.CreateObject("ADODB.Recordset")
		If Err.Number <> 0 Then
			Response.write "<div class=""error"">Erro na criação de objeto para conexão</div>"
		else
			conexao.Open "Provider=sqloledb;Data Source=localhost\SQLEXPRESS;Initial Catalog=to_do_list;User ID=root;Password=senhaDesafio123%;"
			If Err.Number <> 0 Then
							Response.write "<div class=""error"">Erro na conexão com banco de dados</div>"
			else
				Set recordSet = conexao.execute("Select * from tarefas order by id DESC")
				if Err.Number <> 0 then
					Response.write "<div class=""error"">Erro na busca das tarefas</div>"
				else


					If recordSet.BOF And recordSet.EOF Then
					    Response.write "<div class=""mensagem"">Não possui tarefas</div>"
					Else
					    Do Until recordSet.EOF
			    			Response.write "<div class='row'><div class = 'col'></div>"
				  			Response.write "<div class='col-sm-9' style = ""padding:10px 1px 20px 1px;height:220px;"" >"
					  			Response.write "<div class='detalhamentoTarefa'>"
									Response.write "<div style = 'width:80%;float: left;'>"
										Response.write "<h5>" & recordSet(1) &"</h5>"
					  					Response.write "<div style = ""overflow:auto;height:70px;"">"
					    				Response.write recordSet(2)
					    				Response.write "</div>"
					    				Response.write "<div style= ""margin-top:10px;""> Vencimento: " & FormatDateTime(recordSet(3),2) & "</div>"
					    			Response.write "</div>"
					    			Response.write "<div style = 'width:20%;margin-left: 90%;'>"
					    				Response.write "<button type=""button"" class=""btn btn-outline-danger"" style=""--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1.50rem; margin-bottom:40px;"" onclick=""removeTarefa('" & recordSet(0) & "')"">Excluir</button></br>"
					    				Response.write "<button type=""button"" class=""btn btn-outline-info"" style=""--bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: 1.50rem;"" onclick=""editarTarefa('" & recordSet(0) & "','" & recordSet(1) & "','" & REPLACE(recordSet(2),VbCrlf,"") & "','" & recordSet(3) & "')"">Editar</button>"
	    							Response.write "</div>"
	    						Response.write "</div>"
	    					Response.write "</div><div class = 'col'></div>"
				    		Response.write "</div>"
				    		recordSet.MoveNext
						Loop
					End If
				end if
			end if
			recordSet.Close
			conexao.close
		end if

		Set conexao = Nothing
		Set recordSet = Nothing
		%>
		</div>    	
	</div>	    
	<form method = "post" action="remove_tarefa.asp" id = "formulario_remocao">
		<input type="hidden" id="idRemovido" name="idRemovido" value="" />
	</form>

	<form method = "post" action="editar_tarefa_01.asp" id = "formulario_edicao">
		<input type="hidden" id="idEditado" name="idEditado" value="" />
		<input type="hidden" id="tituloEditado" name="tituloEditado" value="" />
		<input type="hidden" id="descricaoEditado" name="descricaoEditado" value="" />
		<input type="hidden" id="dataEditado" name="dataEditado" value="" />
	</form>

</body>
</html>

<script>
    window.addEventListener('DOMContentLoaded', (event) => {
        document.getElementById("dataDeVencimentoDaTarefa").valueAsDate = new Date();
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
