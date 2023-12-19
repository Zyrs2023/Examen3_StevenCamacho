<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Encuesta.aspx.cs" Inherits="Examen3.Encuesta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link rel="stylesheet" href="~/css/bootstrap.min.css">
    <link href="Estilos/Estilo.css" rel="stylesheet" />
    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <img src="Imagen/logo.gif" />
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center">Encuesta</h2>

                <div class="form-group">
                    <label for="txtNombre">Nombre:</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtEdad">Edad:</label>
                    <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" Required="true" Type="Number" Min="18" Max="50"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="txtCorreo">Correo Electrónico:</label>
                    <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Required="true" Type="email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="ddlPartidoPolitico">Partido Político:</label>
                    <asp:DropDownList ID="ddlPartidoPolitico" runat="server" CssClass="form-control" Required="true">
                        <asp:ListItem Text="Seleccione un partido" />
                        <asp:ListItem Text="PLN" Value="1" />
                        <asp:ListItem Text="PUSC" Value="2" />
                        <asp:ListItem Text="PAC" Value="3" />
                    </asp:DropDownList>
                </div>
                <div class="text-center">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar Encuesta" OnClick="btnGuardar_Click" CssClass="btn btn-rounded-rectangular" />
                </div>
            </div>
        </div>
    </div>


    <script src="~/js/bootstrap.min.js"></script>
</asp:Content>

