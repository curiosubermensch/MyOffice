<%@ Page Title="" Language="C#" MasterPageFile="~/RegistroPagos.Master" AutoEventWireup="true" CodeBehind="Pagos.aspx.cs" Inherits="MyOffice.Pagos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style5 {
        color: #990000;
    }
    .auto-style7 {
        color: #990000;
        font-size: x-large;
        text-align: left;
    }
    .auto-style8 {
            color: #C0C0C0;
            width: 266px;
        }
    .auto-style10 {
        color: #000000;
            text-align: left;
        }
    .auto-style11 {
        color: #990000;
        font-size: large;
    }
    .auto-style12 {
        color: #990000;
        font-size: large;
        text-align: center;
    }
    .auto-style18 {
        font-size: x-large;
        color: #990000;
        text-align: right;
    }
        .auto-style19 {
            color: #C0C0C0;
            text-align: center;
        }
        .auto-style20 {
            height: 23px;
        }
        .auto-style22 {
            color: #000000;
            height: 23px;
            width: 101px;
        }
        .auto-style24 {
            color: #C0C0C0;
            width: 266px;
            text-align: left;
            height: 30px;
        }
        .auto-style25 {
            height: 30px;
            text-align: right;
            width: 108px;
        }
        .auto-style26 {
            height: 26px;
        }
        .auto-style28 {
            color: #000000;
            height: 26px;
            width: 101px;
        }
        .auto-style29 {
            height: 30px;
            text-align: left;
        }
        .auto-style31 {
            height: 23px;
            width: 108px;
        }
        .auto-style32 {
            height: 26px;
            width: 108px;
        }
        .auto-style33 {
            width: 108px;
        }
        .auto-style35 {
            text-align: right;
            width: 101px;
        }
        .auto-style36 {
            font-weight: bold;
        }
        .auto-style37 {
            color: #C0C0C0;
            text-align: center;
            width: 87px;
        }
        .auto-style38 {
            color: #C0C0C0;
            text-align: center;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style1">
        <tr>
            <td  colspan="9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="9">Pagos</td>
        </tr>
        <tr>
            <td  colspan="9">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style12" colspan="4">Insertar Pagos:</td>
            <td class="auto-style11" colspan="4">Modificar Pagos:</td>
            <td class="auto-style15">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">&nbsp;</td>
            <td class="auto-style12" colspan="5">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31">Codigo Articulo:</td>
            <td colspan="3" >
                <asp:DropDownList ID="ddlArticulos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectDdlArticulo">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lbArticulo" runat="server"></asp:Label>
                <br />
            </td>
            <td class="auto-style22" colspan="3">Buscar:</td>
            <td colspan="2" class="auto-style20"> 
                <asp:DropDownList ID="ddlRut" runat="server" AutoPostBack="True">
                    <asp:ListItem>Todos</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style32">Rut cliente:</td>
            <td colspan="3" >
                <asp:DropDownList ID="ddlClientes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SelectDdlCliente">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbCliente" runat="server"></asp:Label>
                <br />
            </td>
            <td class="auto-style28" colspan="3">
                Lista de pagos:</td>
            <td colspan="2" class="auto-style26">
                <asp:Label ID="lbNombre" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style33">Cantidad:</td>
            <td class="auto-style8" colspan="3">
                <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
                <br />
            </td>
            <td class="auto-style10" colspan="5" rowspan="3">
                <asp:ListBox  Font-Size ="Medium"  BackColor ="#ffcc66"  ID ="lstPagos" runat="server" AutoPostBack="True"   CssClass="auto-style36">
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style33" >
                Total:</td>
            <td class="auto-style8" colspan="3">
                <asp:TextBox ID="txtTotal" runat="server" ReadOnly="True"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style33" >
                &nbsp;</td>
            <td class="auto-style8" colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25">
                <asp:Button ID="btIngresar" runat="server" OnClick="IngresarPago" Text="Ingresar" />
            </td>
            <td class="auto-style24" colspan="3">
                <asp:Button ID="btCancelar" runat="server" OnClick="Cancelar" Text="Cancelar" />
            </td>
            <td class="auto-style35" colspan="3" >
                <asp:Button ID="btnBuscar" runat="server" OnClick="ActualizarPagos" Text="Buscar" />
            </td>
            <td colspan="2" class="auto-style29">
                <asp:Button ID="btnEliminar" runat="server" OnClick="EliminarPagos" Text="Eliminar" />
            </td>
        </tr>
        <tr>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style19" colspan="6">
            <asp:Label ID="lbMostrar" runat="server" CssClass="auto-style18"></asp:Label>
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style19" colspan="6">
                &nbsp;</td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style19" colspan="6">
                <asp:Button ID="btMostrarPagos" runat="server" OnClick="MostrarPagos" Text="Mostrar Detalle de Pagos" />
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style31"></td>
            <td class="auto-style38" colspan="6">
            </td>
            <td colspan="2" class="auto-style20"></td>
        </tr>
        <tr>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style19">
                <asp:Label ID="lbRutCliente" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbNombreCliente" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbCodigoArticulo" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style37">
                <asp:Label ID="lbNOmbreArticulo" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbCantidad" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbTotal" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style33">&nbsp;</td>
            <td class="auto-style19">
                <asp:Label ID="Label1" runat="server" Text="lbRuts"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="Label2" runat="server" Text="lbClientess"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="Label3" runat="server" Text="lbCodigos"></asp:Label>
            </td>
            <td class="auto-style37">
                <asp:Label ID="Label4" runat="server" Text="lbArticuloss"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbCantss" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="auto-style19">
                <asp:Label ID="lbTotales" runat="server" Text="Label"></asp:Label>
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
