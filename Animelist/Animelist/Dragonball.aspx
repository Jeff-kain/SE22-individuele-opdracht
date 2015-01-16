<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Dragonball.aspx.cs" Inherits="Animelist.Dragonball" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <div class="jumbotron">
        <h1>Animelist</h1>
        <p class="lead">Below you will find a list of anime's available</p>
    </div>
    <table>
        <tr>
            <td class="normal_header" colspan="1" style="height: 24px; width: 1030px;">Anime</td>
            <td class="normal_header" align="center" style="width: 31px; height: 24px;">Episodes</td>
            <td class="normal_header" align="center" style="height: 24px">Genre</td>
            <td class="normal_header" align="center" style="height: 24px; width: 27px;">Score</td>

        </tr>
        <tr>
            <td class="borderClass bgColor" valign="top" style="width: 1030px">
                <a id="dragonball">
                    <strong>Dragonball</strong>
                </a>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                </LoggedInTemplate>
                </asp:LoginView>
                <div class="spaceit">
                    Bulma is a girl in search of the mystical Dragonballs that when brought together grant any wish. In her search she bumps into the owner of one of these balls, a strange boy named Goku. The two then set off together, Bulma in search of the Dragonballs and Goku on a quest to become stronger.
                </div>
            </td>
            <td align="center" style="width: 27px">100</td>
            <td class="borderClass bgColor" align="center">Action</td>
            <td class="borderClass bgColor" align="center" style="width: 27px">9.1</td>
        </tr>
      </table>

            <table>
        <tr>
            <td>
            </td>
            <td style="padding-left: 20px;">
                <asp:TextBox ID="txtCommentBody" TextMode="MultiLine" Height="88px" runat="server" Width="266px" />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="rfvCommentBody" runat="server" Display="Dynamic"
                    ControlToValidate="txtCommentBody" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
            </td>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
            <td style="padding-left: 20px;">
                <asp:Button ID="btnAdd" runat="server" OnClick="AddComment" Text="Add Comment" />
            </td>
                </LoggedInTemplate>
                </asp:LoginView>
            <td>
            </td>
        </tr>
    </table>
        <div class="rpComments">
    <asp:Repeater ID="rptComments" runat="server">
        <ItemTemplate>
            <table>
                <tr>
                    <td style="padding-left: 20px;">
                        <b><asp:Label ID="lblEmail" runat="server" Text='<%# Eval("mailaddress") %>'></asp:Label></b>
                    </td>
                </tr>
                <td style="padding-left: 20px; padding-bottom: 15px;">
                    <asp:Label ID="lblCommentBody" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                </td>
            </table>
        </ItemTemplate>
    </asp:Repeater>
    <hr />
     </div>
</asp:Content>
