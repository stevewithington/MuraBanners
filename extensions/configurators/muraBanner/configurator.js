/**
* 
* This file is part of MuraBanners TM
*
* Copyright 2012 Stephen J. Withington, Jr.
* Licensed under the Apache License, Version v2.0
* http://www.apache.org/licenses/LICENSE-2.0
*
*/
function initMuraBannersConfigurator(data) {

	initConfigurator(data,{
		url: '../plugins/MuraBanners/extensions/configurators/muraBanner/configurator.cfm'
		, pars: ''
		, title: 'MuraBanner'
		, init: function(){}
		, destroy: function(){}
		, validate: function(){
			//if ( jQuery('#width').val() != 900 ) {
//				var response = confirm('Dude...seriously?');
//				if ( !response ) return false;
//			};
			return true;
		}
	});

	return true;

};