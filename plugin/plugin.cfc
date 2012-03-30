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
*/
component accessors=true extends='mura.plugin.plugincfc' output=false {

	property name='config';
	property name='packageName';
	
	/**
	* Constructor
	* @output false
	*/
	public any function init(config='') {
		if ( IsSimpleValue(arguments.config) and StructKeyExists(application, 'configBean') ) {
			arguments.config = application.configBean;
		};
		setConfig(arguments.config);
		setPackageName('MuraBanners');
		return this;
	};
	
	/**
	* @output false
	*/
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
	
	/**
	* @output false
	*/
	public void function update() {
		var local = {};
		super.update();
	};
	
	/**
	* @output false
	*/
	public void function delete() {
		var local = {};
		super.delete();
	};
	
	/**
	* i check to see if this plugin has already been installed. if so, i delete the new one.
	* @output false
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