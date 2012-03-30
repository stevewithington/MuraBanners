#MuraBanners TM

MuraBanners enables you to have a specific banner for each page of the site. If no banner is selected for a specific page, then this plugin begins checking each parent on up to the Home Page looking for one to use, unless you explicitly set Use Parent Banner to No, or its parent doesn't have a banner and is set to No. You can even specify the width and height of the banner.

##Content Editors/Authors

Simply go to the Extended Attributes tab, then upload a banner image (.jpg, .jpeg, .gif, .png). If your layout template doesn't already contain the code for the banner to display, you can use [mura] tags to do so inline with your content via the Content Editor.

###Example:

```[mura]$.muraBanners.dspBanner()[/mura]```

##Developers & Designers

You can easily drop the following code into any layout template (e.g., header.cfm) and be done:

###Example:
```#$.muraBanners.dspBanner(width=yourDesiredWidth, height=yourDesiredHeight)#```


##Tested With

* Mura CMS Core Version **5.6.4859**
* Adobe ColdFusion **9.0.1**
* Railo **3.3.1**