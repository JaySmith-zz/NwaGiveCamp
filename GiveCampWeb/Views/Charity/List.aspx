<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<GiveCampWeb.Models.CharityRequirement>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Charity List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 800px;">
        <h2>
            Registered Charities</h2>
        <table>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td valign="top">
                    <%= Html.Hidden(item.CharityRequirementId.ToString())%>
                    <b><%= Html.ActionLink(Html.Encode(item.CharityName), "Detail", new { id = item.CharityRequirementId })%></b>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <%= Html.Encode(item.BackgroundInformation) %>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadScriptRegion" runat="server">
</asp:Content>
