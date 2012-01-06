<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<GiveCampWeb.Models.Sponsor>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Create
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Create</h2>

    <% using (Html.BeginForm()) {%>
        <%= Html.ValidationSummary(true) %>

        <fieldset>
            <legend>Fields</legend>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Id) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Id) %>
                <%= Html.ValidationMessageFor(model => model.Id) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.IsActive) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.IsActive) %>
                <%= Html.ValidationMessageFor(model => model.IsActive) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.LogoUrl) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.LogoUrl) %>
                <%= Html.ValidationMessageFor(model => model.LogoUrl) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Name) %>
                <%= Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Description) %>
                <%= Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.Url) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.Url) %>
                <%= Html.ValidationMessageFor(model => model.Url) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContactName) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContactName) %>
                <%= Html.ValidationMessageFor(model => model.ContactName) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContactEmail) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContactEmail) %>
                <%= Html.ValidationMessageFor(model => model.ContactEmail) %>
            </div>
            
            <div class="editor-label">
                <%= Html.LabelFor(model => model.ContactPhone) %>
            </div>
            <div class="editor-field">
                <%= Html.TextBoxFor(model => model.ContactPhone) %>
                <%= Html.ValidationMessageFor(model => model.ContactPhone) %>
            </div>
            
            <p>
                <input name="saveButton" type="submit" value="Create" />
                <input name="cancelButton type="submit" value="Cancel" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%= Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadScriptRegion" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="SideBar" runat="server">
</asp:Content>

