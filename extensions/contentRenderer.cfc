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
component accessors=true extends='mura.cfobject' output=false {
	
	property name='$';
	
	/**
	* Constructor
	* @output false
	*/
	public any function init(required struct $) {
		set$($);
		return this;
	};

	/**
	* dspBanner()
	* Depends on the extended attribute 'bannerImage' being available under Custom Class Extensions
	* which is auto-created upon plugin installation
	* @output false
	* @$ mura scope
	* @size options: large,medium,small,custom
	* @height in pixels
	* @width in pixels
	*/
	public any function dspBanner(
		struct $=get$()
		, contentid=$.content('contentid')
		, size='large'
		, height='auto'
		, width='auto'
		, alt=$.content('title')
	) {
		var local = {};
		local.content = $.getBean('content').loadBy(arguments.contentid);
		local.bannerImageFileID = local.content.getValue('bannerImage');
		local.useParent = YesNoFormat(local.content.getValue('bannerParent'));	
		local.fm = $.getBean('fileManager');
		local.meta = local.fm.readMeta(local.bannerImageFileID);
		
		// check to make sure it's an image
		if ( not ListFindNoCase('jpg,jpeg,gif,png', local.meta.fileExt) ) {
			if ( local.content.getContentID() eq '00000000000000000000000000000000001' or !local.useParent) {
				return '';
			} else { // try the parent node
				return dspBanner(
					contentid = local.content.getParentID()
					, size = arguments.size
					, height = arguments.height
					, width = arguments.width
				);
			};
		};
		
		local.imgSrc = local.fm.createHrefForImage(
			fileID = local.meta.fileid
			, fileExt = local.meta.fileExt
			, size = arguments.size
			, direct = true
			, complete = true
			, height = arguments.height
			, width = arguments.width
		);
		
		return '<img border="0" alt="' & HTMLEditFormat(arguments.alt) & '" src="' & local.imgSrc & '" />';
	};

	/**
	* Metadata property inspector
	* @output false
	*/
	public struct function getProperties() {
		var local = {};
		local.properties = {};
		local.data = getMetaData(this).properties;
		for ( local.i=1; local.i lte ArrayLen(local.data); local.i++ ) {
			local.properties[local.data[local.i].name] = Evaluate('get#local.data[local.i].name#()');
		};
		return local.properties;
	};

}
</cfscript>