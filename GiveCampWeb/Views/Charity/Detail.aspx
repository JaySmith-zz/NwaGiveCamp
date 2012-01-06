<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GiveCampWeb.Models.CharityRequirement>" %>

<%@ Import Namespace="GiveCampWeb.Models" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Detail
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Charity Details</h2>
    <table>
        <tr>
            <td>
                Name
            </td>
            <td>
                <%= Html.Encode(Model.CharityName) %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top">
                Background information
            </td>
            <td>
                <%= Html.Encode(Model.BackgroundInformation)%>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top">
                Work
            </td>
            <td>
                <%= Html.Encode(Model.WorkRequested) %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div class="rowwrap">
                    <div class="label">
                        Select from technologies below:</div>
                    <div class="input">
                        <% 
                            foreach (CharityRequirementTechnologiesUsed r in Model.CharityRequirementTechnologiesUseds)
                            {
                        %>
                        <label for="<%="Infrastructure." + r.Technology.Description %>">
                            <%=r.Technology.Description%></label>
                        <% 
                            } %>
                        <%= Html.ValidationMessage("Infrastructure")%>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top">
                Infrastructure
            </td>
            <td>
                <%= Html.Encode(Model.OtherInfrastructure) %>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td valign="top">
                Support Skills
            </td>
            <td>
                <%= Html.Encode(Model.OtherSupportSkills) %>
            </td>
        </tr>
    </table>
    <p>
        <%= Html.ActionLink("Back to List", "List") %>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadScriptRegion" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SideBar" runat="server">
</asp:Content>
