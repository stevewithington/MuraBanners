<cfscript>
/**
* 
* This file is part of MuraBanners TM
*
* Copyright 2012 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.pluginGenericEventHandler' output=false {

	public any function onApplicationLoad(required struct $) {
		variables.pluginConfig.addEventHandler(this);
	};

	public any function onSiteRequestStart(required struct $) {
		var local = {};
		local.contentRenderer = new contentRenderer($);
		$.setCustomMuraScopeKey('muraBanners', local.contentRenderer);
	};


	/* 
	* CONFIGURED DISPLAY OBJECTS
	* --------------------------------------------------------------------- */

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