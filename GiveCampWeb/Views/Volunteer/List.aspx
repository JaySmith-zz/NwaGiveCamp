<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<GiveCampWeb.Models.Volunteer>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Volunteer List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 800px;">
        <h2>
            Registered Volunteers</h2>
        <table style="width:100%">
            <tr>
                <th align="left">
                    <b>First Name</b>
                </th>
                <th align="left">
                   <b>Last Name</b>
                </th>
                <th align="left">
                    <b>Team Name</b>
                </th>
                <th align="left">
                    <b>Email Address</b>
                </th>
                <th align="left">
                    <b>Phone Number</b>
                </th>
            </tr>
            <% foreach (var item in Model)
               { %>
            <tr>
                <td>
                    <%= Html.Hidden(item.VolunteerID.ToString()) %>
                    <%= Html.Encode(item.FirstName) %>
                </td>
                <td>
                    <%= Html.Encode(item.LastName) %>
                </td>
                <td>
                    <%= Html.Encode(item.TeamName) %>
                </td>
                <td>
                    <%= Html.Encode(item.EmailAddress) %>
                </td>
                <td>
                    <%= Html.Encode(item.PhoneNumber) %>
                </td>
            </tr>
            <% } %>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadScriptRegion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SideBar" runat="server">
</asp:Content>
