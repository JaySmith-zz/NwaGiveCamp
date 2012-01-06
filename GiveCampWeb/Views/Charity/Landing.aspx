<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    For Charities
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeadScriptRegion" runat="server">
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#navCharity").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="pagetitle">
        Charity Information</h1>
    <div class="post">
        <h2 class="title">
            2011 Charities</h2>
        <div class="entry">
            <p>
                <ol>
                    <li>Cobble Stone Project</li>
                    <li>Mashburn Scholarship Foundation</li>
                    <li>Ozark Figure Skating Club</li>
                    <li>Washington County Historical Society</li>
                    <li>Special Olympics Arkansas</li>
                </ol>
            </p>
        </div>
        <p class="meta">
        </p>
    </div>
    <!--
    <h1 class="pagetitle">
        Resources and Information for Charities</h1>
        <div class="post">
			<h2 class="title">Charity Submissions Closed!</h2>
			<div class="entry">
				<p>The submission period has closed, announcements will be made shortly 
                regarding the charites that have been accepted into the event.
				</p>
			</div>
			<p class="meta"></p>
		</div> -->
    <!-- 
        <div class="post">
			<h2 class="title">Information For Charities</h2>
			<div class="entry">
				<p>Below is a link to a form to fill out.  Please read the 
				    <%=Html.ActionLink("FAQ","FAQs","Home") %>
				    prior to submitting the form.  Keep in mind scoped work should
				    be able to be accomplished in one weekend's time.
				</p>
				<p><%=Html.ActionLink("Submit your proposal","SignUp") %></p>
			</div>
			<p class="meta"></p>
		</div>
        -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBar" runat="server">
    <ul>
        <li>
            <h2>
                Charity Resources</h2>
            <ul>
                <li><a href="http://www.givecamp.org" target="_blank">GiveCamp Main Site</a></li>
                <li><a href="http://www.lansinggivecamp.org/" target="_blank">Lansing GiveCamp</a></li>
                <li><a href="http://www.michigangivecamp.org/" target="_blank">Michigan GiveCamp</a></li>
            </ul>
        </li>
    </ul>
</asp:Content>
