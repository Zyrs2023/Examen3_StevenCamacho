<%@ Page Title="" Language="C#" MasterPageFile="~/Menu.Master" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="Examen3.Reporte" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Estilos/Reporte.css" rel="stylesheet" />
    <img src="Imagen/logo.gif" />
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12 text-center">
                <h2>Reporte</h2>
            </div>
        </div>
        <div class="table-responsive">
            <asp:GridView runat="server" ID="datagrid" PageSize="10" HorizontalAlign="Center"
                CssClass="table table-bordered table-striped" PagerStyle-CssClass="pager"
                HeaderStyle-CssClass="header" RowStyle-CssClass="rows" AllowPaging="True"
                AutoGenerateColumns="True" />
        </div>
    </div>
</asp:Content>



