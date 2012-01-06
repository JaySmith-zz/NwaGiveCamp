<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    GiveCamp Northwest Arkansas
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeadScriptRegion" runat="server">
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $("#navHome").addClass("active");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 class="pagetitle">
        Announcements</h1>
    <div class="post">
        <h2 class="title">
            2011 Volunteers: The Real Rock Stars!!!!</h2>
        <div class="entry">
            <p align="center"><img src="../../Content/Images/nwagc_2011.JPG" width="500px" alt="2011 Give Camp Volunteers" /></p>
            <p>
                Thanks to all of the Volunteers that are woking on projects for the Northwest Arkansas
                GiveCamp, You guys ROCK!
            </p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            2011 Charities Announced</h2>
        <div class="entry">
            <p>
                I am pleased to announce that we have selected the charities for the 2011 Northwest
                Arkansas GiveCamp. It was a very difficult decision; there are so many deserving
                organizations in Northwest Arkansas.
            </p>
            <p>
                Congratulations to all the selected charities! Check out the <a href="/Charity">charity
                    page</a> for the full list.
            </p>
            <p>
                We are still looking for technical volunteers and event staff volunteers. If you
                can dedicate some of your time for the event please <a href="/Volunteer">register as
                    a volunteer</a>.</p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            Charity Submissions Closed</h2>
        <div class="entry">
            <p>
                Charity sumbmissions have closed for the event. We are currently in the process
                of finalizing the charities that will be participating.</p>
            <p>
                Thanks to everyone who has registered!</p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            Call for Analyst</h2>
        <div class="entry">
            <p>
                The Northwest Arkansas GiveCamp is looking for a few good analyst. We are in need
                of analyst to perform a first touch activity to gather detail requirements from
                the non-profits that register for this event. This information will be used to determine
                if the projects requested fit the timeframe we have for the event.</p>
            <p>
                If you are interested please contact Jay Smith at jay@jaysmith.us.</p>
            <p>
                If you are interested in helping make this event a huge success then contact Jay
                Smith at jay_removeme_@jaysmith.us!</p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            Dates Announced: January 14-16, 2011</h2>
        <div class="entry">
            <p>
                The Northwest Arkansas GiveCamp will be held January 14-16, 2011 at the University
                of Arkansas Union Ballroom. Emails to non-profits announcing the event will be going
                out this week. Please direct any you know to please visit our site and register
                for the event. More details to come soon on the selection process.</p>
            <p>
                If you are interested in helping make this event a huge success then contact Jay
                Smith at jay_removeme_@jaysmith.us!</p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            University Of Arkansas Union To Host GiveCamp</h2>
        <div class="entry">
            <p>
                I am happy to announce that the Northwest Arkansas GiveCamp has found a home at
                the University of Arkansas. Thanks to the great folks at the University we will
                be able to utilize the UofA Union Ballroom and surrounding conferencing rooms.</p>
            <p>
                If you are interested in helping make this event a huge success then contact Jay
                Smith at jay_removeme_@jaysmith.us!</p>
        </div>
        <p class="meta">
        </p>
    </div>
    <div class="post">
        <h2 class="title">
            Looking for GiveCamp Leaders</h2>
        <div class="entry">
            <p>
                We are currently recruiting for the Northwest Arkansas GiveCamp Leadership team.
                This team will be responsible for the getting the event organized and off the ground.</p>
            <p>
                If you are interested in helping make this event a huge success then contact Jay
                Smith at jay@jaysmith.us!</p>
        </div>
        <p class="meta">
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="SideBar" runat="server">
    <h2>
        Information</h2>
    <p>
        Date: January 14-16, 2011<br />
        Location: UofA Union Ballroom <a href="http://uark.edu" title="University of Arkansas">
            <img src="../../Content/Images/SponsorLogos/university_arkansas_logo.jpg" width="200px"
                border="0" /></a>
    </p>
    <ul>
        <li>
            <h2>
                GiveCamp Resources</h2>
            <ul>
                <!-- li><%= Html.ActionLink("Charity Registration", "SignUp", "Charity") %></ li -->
                <li>
                    <%= Html.ActionLink("Volunteer Registration", "SignUp", "Volunteer")%></li>
            </ul>
        </li>
    </ul>
    <h2>
        What is a GiveCamp?</h2>
    <p>
        <object width="300" height="200">
            <param name="allowfullscreen" value="true" />
            <param name="allowscriptaccess" value="always" />
            <param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=8474638&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=&amp;fullscreen=1&amp;autoplay=0&amp;loop=0" />
            <embed src="http://vimeo.com/moogaloop.swf?clip_id=8474638&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=&amp;fullscreen=1&amp;autoplay=0&amp;loop=0"
                type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always"
                width="250" height="200"></embed></object>
    </p>
</asp:Content>
