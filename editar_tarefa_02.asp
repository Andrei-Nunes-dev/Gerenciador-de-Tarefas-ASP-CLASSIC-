<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Editor de Tarefas</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<link rel="stylesheet" href="Estilos/estilos.css">
</head>

<% 
	On Error Resume Next
	Function FormatarApostrofo(stringPura)
		stringSeparada = Split(stringPura,"'")
		Dim stringFormatada
		for each x in stringSeparada
			stringFormatada = stringFormatada & x & "''"
		next
		FormatarApostrofo = Mid(stringFormatada,1,len(stringFormatada) - 2)
	End function
%>


<body style="background-color: #099FFC;">
	<header style="background-color:white;">
		<h1 align="center" style = "text:blue;text-decoration: underline;">Editor de Tarefa</h1>
	</header>
	<div class="container text-center" id = "CONTAINERPRINCIPAL" style="background-color: white; border-radius: 25px;">
			<div class="row" style="padding: 7px;">
				<div class="col"></div>
				<div class="col-9">
					<%
						
						'Resgata os dados passados pelo formulário'
						tituloDaTarefa = CStr(Request.Form("tituloDaTarefa"))
					 	descricaoDaTarefa = CStr(Request.Form("descricaoDaTarefa"))
						dataDeVencimentoDaTarefa = Request.Form("dataDeVencimentoDaTarefa")
						idDaTarefa = Cint(Request.Form("idDaTarefa"))

						Response.write tituloDaTarefa
						Response.write descricaoDaTarefa

						'Retira os espaços das strings'
						tituloDaTarefa = Trim(tituloDaTarefa)
						descricaoDaTarefa = Trim(descricaoDaTarefa)

						if InStr(tituloDaTarefa, "'") > 0 then
							tituloDaTarefa = FormatarApostrofo(tituloDaTarefa)
						end if
						if InStr(descricaoDaTarefa, "'") > 0 then
							descricaoDaTarefa = FormatarApostrofo(descricaoDaTarefa)
						end if

						'Verificação para edição'
						Dim tamanhoInvalido 
						tamanhoInvalido = 0
						if (len(tituloDaTarefa) > 40) or (len(descricaoDaTarefa) > 500) Then
							tamanhoInvalido = 1
						elseif (len(tituloDaTarefa) <= 0) or (len(descricaoDaTarefa) <= 0) Then
							tamanhoInvalido = 1
						end if


						if tamanhoInvalido = 1 Then
							Response.write "<div class=""error"">Tamanho inválido: Título deve conter no máximo 40 caracteres e descrição deve conter no máximo 500 caracteres</div>"
						else
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
									SQL = "update tarefas SET titulo = '" &   tituloDaTarefa & "', descricao = '" &   descricaoDaTarefa & "',data_vencimento = '" & dataDeVencimentoDaTarefa & "' where id = "& idDaTarefa & ";"
									conexao.Execute SQL, num, adExecuteNoRecords
									if num > 0 and Err.Number = 0 then
										Response.write "<div class=""sucesso"">Edição concluída</div>"
									else
										Response.write "<div class=""error"">Falha na edição da tarefa</div>"
									end if
								end if
							end if	
								Set conexao = Nothing
						end if
						Response.write "<a class=""btn btn-primary"" href=""/ToDoList_Avine_ASP"" role=""button"">Voltar para página principal</a>"
					%>
				</div>
				<div class="col"></div>
			</div>
	</div>
</body>
</html>
