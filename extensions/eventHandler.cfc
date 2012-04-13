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
*
* @$ mura scope
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {
	
	/**
	* onApplicationLoad()
	* @output false
	* @$ mura scope
	*/
	public any function onApplicationLoad(required struct $) {
		variables.pluginConfig.addEventHandler(this);
	};
	
	/**
	* onSiteRequestStart()
	* @output false
	* @$ mura scope
	*/
	public any function onSiteRequestStart(required struct $) {
		var local = {};
		local.contentRenderer = new contentRenderer($);
		$.setCustomMuraScopeKey('muraBanners', local.contentRenderer);
	};


	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */
	
	/**
	* dspConfiguredMuraBanner()
	* @output false
	* @$ mura scope
	*/
	public any function dspConfiguredMuraBanner(required struct $) {
		var local = {};

		local.params = $.event('objectParams');
		
		local.defaultParams = {
			size = 'large'
			, width = 'AUTO'
			, height = 'AUTO'
			, $ = arguments.$
			, alt = $.content('title')
			, contentid = $.content('contentid')
		};

		StructAppend(local.params, local.defaultParams, false);

		local.str = $.muraBanners.dspBanner(argumentCollection=local.params);
		
		/*
		savecontent variable='local.str' {
			WriteOutput('<h3>MuraBanners&trade;</h3><h4>Available objectParams</h4><ul>');
			for ( local.key in local.params ) {
				if ( IsSimpleValue(local.params[local.key]) ) {
					WriteOutput(
						'<li><strong>' & local.key & '</strong>: ' & local.params[local.key] & '</li>'
					);
				} else {
					//WriteDump(local.params[local.key]); // probably the mura scope
				};
			};
			WriteOutput('</ul>');
		};
		*/
		
		return local.str;
	};

}
</cfscript>