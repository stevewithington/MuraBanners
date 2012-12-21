/**
* 
* This file is part of MuraBanners TM
*
* Copyright 2012 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
component accessors=true extends='mura.plugin.plugincfc' output=false {

	property name='config';
	property name='packageName';

	public any function init(config='') {
		if ( IsSimpleValue(arguments.config) && StructKeyExists(application, 'configBean') ) {
			arguments.config = application.configBean;
		};
		setConfig(arguments.config);
		setPackageName('MuraBanners');
		return this;
	}
	
	public void function install() {
		super.install();
	}

	public void function update() {
		super.update();
	}
	
	public void function delete() {
		super.delete();
	}

	/**
	* Metadata property inspector
	*/
	public struct function getProperties() {
		var local = {};
		local.properties = {};
		local.data = getMetaData(this).properties;
		for ( local.i=1; local.i lte ArrayLen(local.data); local.i++ ) {
			local.properties[local.data[local.i].name] = Evaluate('get#local.data[local.i].name#()');
		};
		return local.properties;
	}

}