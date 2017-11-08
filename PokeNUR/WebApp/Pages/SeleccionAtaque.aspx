<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="SeleccionAtaque.aspx.cs" Inherits="Pages_SeleccionAtaque" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Seleccionar Ataques</h1>
    <div class="contenedor">
        <div class="misPokemones">
            <asp:GridView CssClass="listaPoke" ID="GridViewPokemones" runat="server" Visible="false"></asp:GridView>
            <asp:ObjectDataSource runat="server" ID="odsPokemonByUser"></asp:ObjectDataSource>
        </div>
        <div class="ataques">
            <asp:GridView CssClass="listaAtaques" ID="GridViewAtaques" runat="server">
                <columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxTonto" runat="server" AutoPostBack="true" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </columns>
            </asp:GridView>
            <asp:Button CssClass="boton" ID="ButtonHecho" runat="server" Text="Hecho" OnClick="ButtonHecho_Click"/>
            
        </div>
    </div>
</asp:Content>

