<%@ Page Title="" Language="C#" MasterPageFile="~/RegistroPagos.Master" AutoEventWireup="true" CodeBehind="Cliente.aspx.cs" Inherits="MyOffice.Cliente" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 23px;
        }
        .auto-style6 {
            text-align: right;
        }
        .auto-style7 {
            text-align: center;
            font-size: large;
            color: #990000;
        }
        .auto-style8 {
            height: 23px;
            text-align: center;
        }
        .auto-style9 {
            height: 23px;
            text-align: center;
            font-size: x-large;
            color: #990000;
        }
        .auto-style10 {
            color: #990000;
        }
    .auto-style18 {
        font-size: x-large;
        color: #990000;
        text-align: right;
    }
        .auto-style19 {
            height: 23px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <table class="auto-style1">
        <tr>
            <td  colspan="6">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9" colspan="6">Clientes</td>
        </tr>
        <tr>
            <td  colspan="6"></td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="2">Insertar Cliente:</td>
            <td class="auto-style6" colspan="2"><span class="auto-style10">Modificar Datos del cliente</span>:</td>
            <td class="auto-style15" colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" ></td>
            <td  colspan="4"></td>
        </tr>
        <tr>
            <td class="auto-style13">Rut Cliente:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtRut" runat="server"></asp:TextBox>
                <br />
            </td>
            <td class="auto-style6">Rut Cliente</td>
            <td colspan="3">
                <asp:DropDownList ID="ddlRut" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRut_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Nombre:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                <br />
            </td>
            <td class="auto-style6">Nombre:</td>
            <td colspan="3">
                <asp:TextBox ID="txtNombreM" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style13">Apellido:</td>
            <td class="auto-style8">
                <asp:TextBox ID="txtApellido" runat="server"></asp:TextBox>
                <br />
            </td>
            <td class="auto-style6">Apellido:</td>
            <td colspan="3">
                <asp:TextBox ID="txtApellidoM" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Button ID="btIngresar" runat="server" OnClick="IngresarCliente" Text="Ingresar" />
            </td>
            <td class="auto-style19">
                <asp:Button ID="btCancelar" runat="server" OnClick="Cancelar" Text="Cancelar" />
            </td>
            <td>&nbsp;</td>
            <td class="auto-style11" colspan="2">
                <asp:Button ID="btnActualizar" runat="server" OnClick="ActualizarCliente" Text="Actualizar" />
            </td>
            <td class="auto-style10">
                <asp:Button ID="btnEliminar" runat="server" OnClick="EliminarCliente" Text="Eliminar" />
            </td>
        </tr>
        <tr>
            <td class="auto-style13">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>
            <asp:Label ID="lbMostrar" runat="server" CssClass="auto-style18"></asp:Label>
            </td>
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
