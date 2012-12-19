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
	$ = application.serviceFactory.getBean('MuraScope').init(session.siteid);

	if ( IsJSON($.event('params')) ) {
		params = DeSerializeJSON($.event('params'));
	} else {
		params = {};
	}

	defaultParams = {
		size = 'large'
		, width = 'AUTO'
		, height = 'AUTO'
	};
	
	StructAppend(params, defaultParams, false);
</cfscript>
<style type="text/css">
	#availableObjectParams dt { padding-top:1em; }
	#availableObjectParams dt.first { padding-top:0; }
</style>
<script>
	jQuery('#size').change(function(){
		var o = jQuery('#customBannerOptions');
		if ( this.value == 'custom' ) {
			o.fadeIn('fast');
		} else {
			o.hide().find(':input').val('AUTO');
		};
	});
</script>
<cfoutput>
	<div id="availableObjectParams"	
		data-object="plugin" 
		data-name="MuraBanner" 
		data-objectid="#$.event('objectID')#">
		<dl class="singleColumn">
			<!--- BANNER SIZE --->
			<dt class="first"><label for="size">Banner Size</label></dt>
			<dd>
				<select name="size" id="size" class="objectParam">
					<cfscript>
						opts = ['Small','Medium','Large','Custom'];
						for ( i=1; i lte ArrayLen(opts); i++ ) {
							WriteOutput('<option value="' & LCase(opts[i]) & '"');
							if ( params.size eq opts[i] ) {
								WriteOutput(' selected="selected"');
							};
							WriteOutput('>' & opts[i] & '</option>');
						};
					</cfscript>
				</select>
			</dd>
			<!--- BANNER WIDTH / HEIGHT --->
			<div id="customBannerOptions"<cfif params.size neq 'custom'> style="display:none;"</cfif>>
				<dt><label for="width">Banner Width</label></dt>
				<dd>
					<input type="text" 
						name="width" id="width"
						class="objectParam" 
						value="#params.width#" />
				</dd>
				
				<dt><label for="height">Banner Height</label></dt>
				<dd>
					<input type="text" 
						name="height" id="height" 
						class="objectParam" 
						value="#params.height#" />
				</dd>
			</div>
			<!---<dt>Display Banner?</dt>
			<dd>
				<input type="radio" name="hide" id="hideYes" class="objectParam" value="true" <cfif YesNoFormat(params.hide)> checked="checked"</cfif>> 
				<label for="hideYes">Yes</label>

				<input type="radio" name="hide" id="hideNo" class="objectParam" value="false"<cfif !YesNoFormat(params.hide)> checked="checked"</cfif>> 
				<label for="hideNo">No</label>
			</dd>--->
			<!--- MISC. --->
			<input type="hidden" name="configuredDTS" class="objectParam" value="#now()#" />
			<input type="hidden" name="configuredBy" class="objectParam" value="#HTMLEditFormat($.currentUser('LName'))#, #HTMLEditFormat($.currentUser('FName'))#" />
		</dl>
	</div>
</cfoutput>