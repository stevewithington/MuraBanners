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
component accessors=true extends='mura.cfobject' output=false {
	
	property name='$';

	public any function init(required struct $) {
		set$($);
		return this;
	}

	/**
	* Depends on the extended attribute 'bannerImage' being available under 
	* Custom Class Extensions which is auto-created upon plugin installation
	*/
	public any function dspBanner(
		size='large'
		, height='AUTO'
		, width='AUTO'
		, $=get$()
		, alt=get$().content('title')
		, contentid=get$().content('contentid')
	) {
		var local = {};
		local.content = arguments.$.getBean('content').loadBy(arguments.contentid);
		local.bannerImageFileID = local.content.getValue('bannerImage');
		local.useParent = YesNoFormat(local.content.getValue('bannerParent'));	
		local.fm = arguments.$.getBean('fileManager');
		local.meta = local.fm.readMeta(local.bannerImageFileID);
		
		// check to make sure it's an image
		if ( !ListFindNoCase('jpg,jpeg,gif,png', local.meta.fileExt) ) {
			if ( local.content.getContentID() == '00000000000000000000000000000000001' || !local.useParent) {
				return '';
			} else { // try the parent node
				return dspBanner(
					contentid = local.content.getParentID()
					, size = LCase(arguments.size)
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
	}

	public struct function getProperties() {
		var local = {};
		local.properties = {};
		local.data = getMetaData(this).properties;
		for ( local.i=1; local.i <= ArrayLen(local.data); local.i++ ) {
			local.properties[local.data[local.i].name] = Evaluate('get#local.data[local.i].name#()');
		};
		return local.properties;
	}

}
</cfscript>