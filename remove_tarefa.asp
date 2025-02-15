<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Remove Tarefa</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="Estilos/estilos.css">
</head>



<body style="background-color: #099FFC;">
	<header style="background-color:white;">
		<h1 align="center" style = "text:blue;text-decoration: underline;">Remoção de Tarefa</h1>
	</header>
	<div class="container text-center" id = "CONTAINERPRINCIPAL" style="background-color: white; border-radius: 25px;">
			<div class="row" style="padding: 7px;">
				<div class="col"></div>
				<div class="col-9">
				<%
					On Error Resume Next
					'Resgata os dados passados pelo formulário'
					idRemovido = Cint(Request.Form("idRemovido"))

					Dim conexao
					Dim num
					Set conexao = Server.CreateObject("ADODB.Connection")
					If Err.Number <> 0 Then
						Response.write "<div class=""error"">Erro na criação de objeto para conexão</div>"
					else
						conexao.Open "Provider=sqloledb;Data Source=localhost\SQLEXPRESS;Initial Catalog=to_do_list;User ID=root;Password=senhaDesafio123%;"
						If Err.Number <> 0 Then
							Response.write "<div class=""error"">Erro na conexão com banco de dados</div>"
						else
							SQL = "delete from tarefas where id = " & idRemovido & ";"
							conexao.Execute SQL, num, adExecuteNoRecords
							if num > 0 and Err.Number = 0 then
								Response.write "<div class=""sucesso"">Tarefa removida</div>"
							else
								Response.write "<div class=""error"">Falha na remoção da tarefa</div>"
							end if
						end if
					end if
					Set conexao = Nothing
					Response.write "<a class=""btn btn-primary"" href=""/ToDoList_Avine_ASP"" role=""button"">Voltar para página principal</a>"
				%>
				</div>
				<div class="col"></div>
			</div>
	</div>
</body>
</html>
