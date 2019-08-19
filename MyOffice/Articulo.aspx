<%@ Page Title="" Language="C#" MasterPageFile="~/RegistroPagos.Master" AutoEventWireup="true" CodeBehind="Articulo.aspx.cs" Inherits="MyOffice.Articulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style5 {
        font-size: x-large;
        color: #800000;
        text-align: center;
    }
    .auto-style6 {
        text-align: right;
        width: 119px;
    }
    .auto-style8 {
        width: 205px;
    }
    .auto-style9 {
        text-align: right;
    }
    .auto-style10 {
        text-align: left;
    }
    .auto-style11 {
        text-align: center;
        width: 96px;
    }
    .auto-style12 {
        text-align: center;
    }
    .auto-style13 {
        width: 119px;
    }
    .auto-style15 {
        text-align: center;
        font-size: large;
        color: #990000;
    }
    .auto-style16 {
        text-align: right;
        font-size: large;
        color: #990000;
    }
    .auto-style17 {
        font-size: x-large;
        color: #990000;
        text-align: center;
    }
    .auto-style18 {
        font-size: x-large;
        color: #990000;
        text-align: right;
    }
        .auto-style20 {
            width: 119px;
            height: 26px;
        }
        .auto-style21 {
            width: 205px;
            height: 26px;
        }
        .auto-style22 {
            text-align: right;
            height: 26px;
        }
        .auto-style23 {
            height: 26px;
        }
        .auto-style24 {
            width: 205px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style1">
    <tr>
        <td  colspan="6"></td>
    </tr>
    <tr>
        <td class="auto-style18" colspan="2">Articulos</td>
        <td class="auto-style17" colspan="2">&nbsp;</td>
        <td class="auto-style17" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td  colspan="6"></td>
    </tr>
    <tr>
        <td class="auto-style15" colspan="2">Insertar Producto:</td>
        <td class="auto-style16" colspan="2">Modificar Producto:</td>
        <td class="auto-style15" colspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">&nbsp;</td>
        <td class="auto-style12" colspan="4">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style13">Ingresar código:</td>
        <td class="auto-style8">
            <asp:TextBox ID="txtCodigo" runat="server"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style9">Codigo:</td>
        <td colspan="3">
            <asp:DropDownList ID="ddlCodigos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCodigoSelected">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="auto-style13">Ingresar nombre:</td>
        <td class="auto-style8">
            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style9">Nombre:</td>
        <td colspan="3">
            <asp:TextBox ID="txtNombreMostrar" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style13">Precio:</td>
        <td class="auto-style8">
            <asp:TextBox ID="txtPrecio" runat="server"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style9">Precio:</td>
        <td colspan="3">
            <asp:TextBox ID="txtPrecioM" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style20">Cantidad:</td>
        <td class="auto-style21">
            <asp:TextBox ID="txtCantidad" runat="server"></asp:TextBox>
            <br />
        </td>
        <td class="auto-style22">Cantidad:</td>
        <td colspan="3" class="auto-style23">
            <asp:TextBox ID="txtCantidadM" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">
            <asp:Button ID="btIngresar" runat="server" OnClick="Ingresar" Text="Ingresar" />
        </td>
        <td class="auto-style8">
            <asp:Button ID="btCancelar" runat="server" OnClick="btCancelar_Click" Text="Cancelar" />
        </td>
        <td>&nbsp;</td>
        <td class="auto-style11" colspan="2">
            <asp:Button ID="btnActualizar" runat="server" OnClick="Actualizar" Text="Actualizar" />
        </td>
        <td class="auto-style10">
            <asp:Button ID="btnEliminar" runat="server" OnClick="Eliminar" Text="Eliminar" />
        </td>
    </tr>
    <tr>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style24">
            <asp:Label ID="lbMostrar" runat="server" CssClass="auto-style18"></asp:Label>
        </td>
        <td>&nbsp;</td>
        <td colspan="3">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style13">&nbsp;</td>
        <td class="auto-style8">&nbsp;</td>
        <td>&nbsp;</td>
        <td colspan="3">&nbsp;</td>
    </tr>
</table>
</asp:Content>

