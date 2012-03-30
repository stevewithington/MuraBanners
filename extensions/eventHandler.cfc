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
* @output false
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
		local.contentRenderer = new contentRenderer($); // init with mura scope!
		$.setCustomMuraScopeKey('muraBanners', local.contentRenderer);
		// now you should be able to call $.muraBanners.someMethod()
	};

}
</cfscript>