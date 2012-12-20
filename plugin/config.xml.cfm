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
</cfscript>
<cfoutput>
<plugin>
	<name>MuraBanners</name>
	<package>MuraBanners</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>2.0.0</version>
	<provider>Steve Withington</provider>
	<providerURL>http://stephenwithington.com</providerURL>
	<category>Utility</category>
	<ormCFCLocation></ormCFCLocation>
	<customTagPaths></customTagPaths>
	<autoDeploy>false</autoDeploy>
	<settings></settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="extensions.eventHandler" persist="false" />
	</eventHandlers>

	<displayobjects location="global">

		<!--- configurable display object --->
		<displayobject name="MuraBanner"  
			component="extensions.eventHandler"
			displaymethod="dspConfiguredMuraBanner"
			configuratorJS="extensions/configurators/muraBanner/configurator.js"
			configuratorInit="init"
			persist="false" />

	</displayobjects>

	<extensions>

		<extension type="Base">

			<attributeset name="MuraBanner Options">

				<attribute name="bannerImage" 
					label="Banner Image" 
					hint="" type="File" 
					defaultValue="" 
					required="false" 
					validation="" 
					regex="" 
					message="" 
					optionList="" 
					optionLabelList="" />

				<attribute name="bannerParent" 
					label="Use Parent Banner (if no banner is uploaded?)" 
					hint="If yes, we will check each parent and their settings for a banner...unless the parent says not to check anymore." 
					type="RadioGroup" 
					defaultValue="1" 
					required="false" 
					validation="" 
					regex="" 
					message="" 
					optionList="1^0" 
					optionLabelList="Yes^No" />

			</attributeset>

		</extension>

	</extensions>

</plugin>
</cfoutput>