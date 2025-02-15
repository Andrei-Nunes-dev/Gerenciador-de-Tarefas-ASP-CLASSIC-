
<%

	'Resgata os dados passados pelo formulário'
	tituloDaTarefa = Request.Form("tituloDaTarefa")
 	descricaoDaTarefa = Request.Form("descricaoDaTarefa")
	dataDeVencimentoDaTarefa = Request.Form("dataDeVencimentoDaTarefa")

	Dim conexao

	Set conexao = Server.CreateObject("ADODB.Connection")

	conexao.Open "Provider=MSDASQL;Driver={MySQL ODBC 5.1 Driver};Server=localhost;Database=to_do_list;User=root;Password=senhaDesafio123%;Option=3;"

	
	SQL = "insert into tarefas(titulo,descricao,data_vencimento) values ('" &   tituloDaTarefa & "','" & descricaoDaTarefa & "','" & dataDeVencimentoDaTarefa & "');"
	conexao.Execute SQL

	If conexao.errors.count = 0 Then

	Response.Write "Connected OK"

End If
Set conexao = Nothing

%>