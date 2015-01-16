<%@ Page Title="Anime" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Anime.aspx.cs" Inherits="Animelist.About" %>

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
                <a id="dragonball" href="Dragonball.aspx">
                    <strong>Dragonball</strong>
                </a>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                <asp:Button CssClass="inputButton" onclick="Add_Anime" Text="Add" ID="Dragonball_button" runat="server"/>
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
        <tr>
            <td class="borderClass bgColor" valign="top" style="width: 1030px">
                <a href="Full Metal Alchemist.aspx">
                    <strong>Full Metal Alchemist</strong>
                </a>
                <asp:LoginView runat="server" ViewStateMode="Disabled">
                <LoggedInTemplate>
                <asp:Button CssClass="inputButton" onclick="Add_Anime" Text="Add" ID="Full_Metal_Alchemist" runat="server"/>
                </LoggedInTemplate>
                </asp:LoginView>
                <div class="spaceit">
                    The rules of alchemy state that to gain something, one must lose something of equal value. Alchemy is the process of taking apart and reconstructing an object into a different entity, with the rules of alchemy to govern this procedure. However, there exists an object that can bring any alchemist above these rules, the object known as the Philosophers Stone. The young Edward Elric is a particularly talented alchemist who through an accident years back lost his younger brother Alphonse and one of his legs. Sacrificing one of his arms as well, he used alchemy to bind his brothers soul to a suit of armor. This lead to the beginning of their journey to restore their bodies, in search for the legendary Philosophers Stone
                </div>
            </td>
            <td align="center" style="width: 27px">150</td>
            <td class="borderClass bgColor" align="center">Action</td>
            <td class="borderClass bgColor" align="center" style="width: 27px">7.9</td>

        </tr>
    </table>
</asp:Content>
