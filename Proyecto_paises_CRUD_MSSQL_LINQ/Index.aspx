<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Proyecto_paises_CRUD_MSSQL_LINQ.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:TextBox ID="txtBuscar" runat="server" Width="407px"></asp:TextBox>
        <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" Text="Buscar" Width="214px" />
        <asp:Button ID="btnCancelar" runat="server" OnClick="btnCancelar_Click" Text="Cancelar" />

    
        <div>
            <asp:Label ID="Label1" runat="server" Text="Nombre País:"></asp:Label>
            <asp:TextBox ID="txtPais" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnRegPais" runat="server" OnClick="btnRegPais_Click" Text="Registrar País" />
            <asp:Button ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" Width="141px" />
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" OnClick="btnActualizar_Click" />
            
            
        </div>
        <asp:GridView ID="gridPaises" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="dsPaises" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="gridPaises_SIC" Width="385px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsPaises" runat="server" ConnectionString="<%$ ConnectionStrings:bd_paisesConnectionString %>" SelectCommand="SELECT * FROM [Pais] ORDER BY [nombre]"></asp:SqlDataSource>
    </form>
</body>
</html>
