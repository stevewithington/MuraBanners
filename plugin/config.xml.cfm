<!--

  This file is part of MuraBanners TM
  (c) Stephen J. Withington, Jr. | www.blueriver.com
 
  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.
  
  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
  
  You should have received a copy of the GNU General Public License along
  with this program; if not, write to the Free Software Foundation, Inc.,
  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

-->
<cfoutput>
<plugin>
	<name>MuraBanners</name>
	<package>MuraBanners</package>
	<directoryFormat>packageOnly</directoryFormat>
	<loadPriority>5</loadPriority>
	<version>0.1 Alpha</version>
	<provider>Steve Withington</provider>
	<providerURL>http://blueriver.com</providerURL>
	<category>Utility</category>
	<settings></settings>
	<eventHandlers>
		<eventHandler event="onApplicationLoad" component="extensions.eventHandler" persist="false" />
	</eventHandlers>
	<displayobjects location="global"></displayobjects>
	<extensions>
		<extension type="Base">
			<attributeset name="MuraBanner Options">
				<attribute name="bannerImage" label="Banner Image" hint="" type="File" defaultValue="" required="false" validation="" regex="" message="" optionList="" optionLabelList="" />
				<attribute name="bannerParent" label="Use Parent Banner (if no banner is uploaded?)" hint="If yes, we will check each parent and their settings for a banner...unless the parent says not to check anymore." type="RadioGroup" defaultValue="1" required="false" validation="" regex="" message="" optionList="1^0" optionLabelList="Yes^No" />
			</attributeset>
		</extension>
	</extensions>
</plugin>
</cfoutput>