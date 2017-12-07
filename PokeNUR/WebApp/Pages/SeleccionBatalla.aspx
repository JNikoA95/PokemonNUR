<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="SeleccionBatalla.aspx.cs" Inherits="Pages_SeleccionBatalla"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1 class="title">Seleccione Tres Pokemons</h1>
    <div class="contenedor">
        <div class="misPokemones">
            <asp:GridView CssClass="listaPoke" ID="listaPoke" runat="server">
                <Columns>
                    <asp:BoundField HeaderText="ID" />
                    <asp:BoundField HeaderText="Pokemon" />
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource runat="server" ID="odsPokemonByUser"></asp:ObjectDataSource>
        </div>

        <div class="misPokemones">
            <asp:GridView CssClass="mGrid" ID="GridViewPokemones" runat="server">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBoxTonto" runat="server" AutoPostBack="true" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button CssClass="boton" ID="ButtonHecho" runat="server" Text="Hecho" OnClick="ButtonHecho_Click" />
        </div>

    </div>
</asp:Content>

