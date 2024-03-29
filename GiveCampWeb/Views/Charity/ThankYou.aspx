﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
For Charities
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeadScriptRegion" runat="server">
    <script language="javascript" type="text/javascript">
       $(document).ready(function() {
       $("#navCharity").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<h1 class="pagetitle">Thank you!</h1>
		<div class="post">
			<h2 class="title">Thank you for submitting your proposal for work</h2>
			<div class="entry">
				<p>You will hear from us soon whether or not your proposal is approved.</p>
			</div>
			<p class="meta"></p>
		</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBar" runat="server">
		<ul>
			<li>
				<h2>Charity Resources</h2>
				<ul>
					<li><a href="http://www.givecamp.org" target="_blank">GiveCamp Main Site</a></li>
					<li><a href="http://www.lansinggivecamp.org/" target="_blank">Lansing GiveCamp</a></li>
					<li><a href="http://www.michigangivecamp.org/" target="_blank">Michigan GiveCamp</a></li>
					<li><a href="http://www.redbull.com" target="_blank">Red Bull</a></li>
				</ul>
			</li>
		</ul>
</asp:Content>

