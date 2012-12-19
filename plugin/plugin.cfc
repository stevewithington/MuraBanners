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
component accessors=true extends='mura.plugin.plugincfc' output=false {

	property name='config';
	property name='packageName';

	public any function init(config='') {
		if ( IsSimpleValue(arguments.config) and StructKeyExists(application, 'configBean') ) {
			arguments.config = application.configBean;
		};
		setConfig(arguments.config);
		setPackageName('MuraBanners');
		return this;
	};
	
	public void function install() {
		var local = {};
		// need to check and see if this is already installed ... if so, then abort!
		local.moduleid = getConfig().getModuleID();
		// only if this is NOT installed
		if ( val(getInstallationCount()) neq 1 ) {
			getConfig().getPluginManager().deletePlugin(local.moduleid);
		};
		super.install();
	};

	public void function update() {
		var local = {};
		super.update();
	};
	
	public void function delete() {
		var local = {};
		super.delete();
	};
	
	/**
	* i check to see if this plugin has already been installed. if so, i delete the new one.
	*/
	private any function getInstallationCount(boolean debug=false) {
		var qs = '';
		var qoq = '';
		var rs = application.configBean.getPluginManager().getAllPlugins();
		var local = {};
		local.ret = 0;
		if ( rs.recordcount ) {
			qs = new query();
			qs.setDBType('query');
			qs.setName('qoq');
			qs.setAttributes(rs=rs); // need this for qoq to work in cfscript
			qs.addParam(name='package', value=getPackageName(), cfsqltype='cf_sql_varchar', maxlength=100);
			qs.setSQL('SELECT * FROM rs where package = :package');
			local.result = qs.execute();
			local.metaInfo = local.result.getPrefix();
			if ( local.metaInfo.recordcount ) {
				local.ret = val(local.metaInfo.recordcount);
			};
		};
		if ( arguments.debug ) {
			return local.result;
		} else {
			return local.ret;
		};
	};

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
	};

}
</cfscript>