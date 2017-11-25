<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Pagina.aspx.cs" Inherits="Pagina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <input type="button" value="Mostrar nombre" onclick="mostrarNombre()" />

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            function mostrarNombre() {
                $.ajax({
                    type: "POST",
                    url: "Pagina.aspx/getNombreCompleto",
                    data: '{"nombre": "Juan", "apellido" : "perez" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d);
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        </script>
    </div>
    </form>
</body>
</html>
