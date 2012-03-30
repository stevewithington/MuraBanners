<cfscript>
/**
*
* This file is part of MuraBanners TM
* (c) Stephen J. Withington, Jr. | www.blueriver.com
*
* This program is free software; you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation; either version 2 of the License, or
* (at your option) any later version.
* 
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
* 
* You should have received a copy of the GNU General Public License along
* with this program; if not, write to the Free Software Foundation, Inc.,
* 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
*/

$ = application.serviceFactory.getBean('muraScope');
if ( StructKeyExists(session, 'siteid') ) {
	$.init(session.siteid);
} else {
	$.init('default');
};
// restrict to Super Users
if ( !StructKeyExists(session, 'siteID') or !$.currentUser().isLoggedIn() or !$.currentUser().isSuperUser() ){
	location(application.configBean.getContext() & '/admin/', false);
};
</cfscript>
<style type="text/css">
	#bodyWrap h3{padding-top:1em;}
	#bodyWrap ul{padding:0 0.75em;margin:0 0.75em;}
</style>
<cfsavecontent variable="body">
<div id="bodyWrap">
	<h2>MuraBanners&trade;</h2>
	<p>MuraBanners enables you to have a specific banner for each page of the site. If no banner is selected for a specific page, then this plugin begins checking each parent on up to the Home Page looking for one to use. You can even specify the width and height of the banner.</p>
	<h3>Content Editors/Authors</h3>
	<p>Simply go to the Extended Attributes tab, then upload a banner image (.jpg, .jpeg, .gif, .png). If your layout template doesn't already contain the code for the banner to display, you can use [mura] tags to do so inline with your content via the Content Editor.</p>
	<h5>Example:</h5>
<pre class="notice">[mura]$.muraBanners.dspBanner()[/mura]</pre>
	<h3>Developers &amp; Designers</h3>
	<p>You can easily drop the following code into any layout template (e.g., header.cfm) and be done:</p>
	<h5>Example:</h5>
	<pre class="notice">#$.muraBanners.dspBanner(width=yourDesiredWidth, height=yourDesiredHeight)#</pre>
	
	<h3>Tested With</h3>
	<ul>
		<li>Mura CMS Core Version <strong>5.6.4859</strong></li>
		<li>Adobe ColdFusion <strong>9.0.1</strong></li>
		<li>Railo <strong>3.3.1</strong></li>
	</ul>
	
	<h3>Questions / Issues?</h3>
	<p>Visit the project at <a href="https://github.com/stevewithington/MuraBanners" target="_blank">https://github.com/stevewithington/MuraBanners</a></p>
	
	<p>Cheers!<br />
	<a href="http://stephenwithington.com">Steve Withington</a></p>
	
</div>
</cfsavecontent>
<cfoutput>
	#$.getBean('pluginManager').renderAdminTemplate(
		body = body
		, pageTitle = ''
		, jsLib = 'jquery'
		, jsLibLoaded = false
	)#
</cfoutput>