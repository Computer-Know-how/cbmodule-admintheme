<cfoutput>
<!--============================Sidebar============================-->
<div class="sidebar">
	<!--- Info Box --->
	<div class="small_box expose">
		<div class="header">
			<i class="icon-medkit"></i> Need Assistance?
		</div>
		<div class="body">
			<a href="http://www.CompKnowHow.com" target="_blank" title="Your ColdBox and ContentBox specialists.">
			<div class="center"><img src="#event.getModuleRoot('AdminTheme')#/includes/images/logo.png" alt="Computer Know How" border="0" /></a><br/></div>

			<p>
				<strong>Computer Know How</strong>
				has a team of talented ColdFusion developers that can be your specialists when it comes to anything ColdBox and ContentBox.
				<a href="mailto:info@compknowhow.com">Contact us</a>, we are here to help!
			</p>
		</div>
	</div>
</div>
<!--End sidebar-->
<!--============================Main Column============================-->
<div class="main_column">
	<div class="box">
		<!--- Body Header --->
		<div class="header">
			<i class="icon-edit"></i> Admin Theme
		</div>
		<!--- Body --->
		<div class="body" id="mainBody">
			#getPlugin("MessageBox").renderit()#

			<div class="alert alert-info">
				Modify your admin theme CSS at <i>"{moduleroot}/includes/css/contentbox-custom.css"</i>.
			</div>
		</div>
	</div>
</div>
</cfoutput>