<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Full Metal Alchemist.aspx.cs" Inherits="Animelist.Full_Metal_Alchemist" %>

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
                <a id="Full Metal Alchemist">
                    <strong>Full Metal Alchemist</strong>
                </a>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                </LoggedInTemplate>
                </asp:LoginView>
                <div class="spaceit">
                    The rules of alchemy state that to gain something, one must lose something of equal value. Alchemy is the process of taking apart and reconstructing an object into a different entity, with the rules of alchemy to govern this procedure. However, there exists an object that can bring any alchemist above these rules, the object known as the Philosophers Stone. The young Edward Elric is a particularly talented alchemist who through an accident years back lost his younger brother Alphonse and one of his legs. Sacrificing one of his arms as well, he used alchemy to bind his brothers soul to a suit of armor. This lead to the beginning of their journey to restore their bodies, in search for the legendary Philosophers Stone.
                </div>
            </td>
            <td align="center" style="width: 27px">210</td>
            <td class="borderClass bgColor" align="center">Action</td>
            <td class="borderClass bgColor" align="center" style="width: 27px">7.9</td>
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

