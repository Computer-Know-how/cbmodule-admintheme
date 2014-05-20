component implements="contentbox.model.ui.admin.IAdminTheme" singleton{

	property name="log" 			inject="logbox:logger:{this}";
	property name="moduleConfig" 	inject="coldbox:moduleConfig:contentbox-admin";

	function init(){
		return this;
	}

	/**
	* Get the internal name of the theme
	*/

	string function getName(){
		return "contentbox-custom";
	}

	/**
	* Get the display name of the theme
	*/

	string function getDisplayName(){
		return "ContentBox Custom";
	}

	/**
	* Get the list of CSS/LESS assets that will be loaded for this theme
	*/

	string function getCSS(){
		var css = '';
		css=listAppend(css,getContextRoot() & moduleConfig.mapping & "/includes/css/contentbox.css");
		css=listAppend(css,"/modules/contentbox/modules/AdminTheme/includes/css/contentbox-custom.css");
		return css;
	}

	/**
	* Get the list of JavaScript assets that will be loaded for this theme
	*/

	string function getJS(){
		var js = '';
		js=listAppend(js,"/modules/contentbox/modules/AdminTheme/includes/js/contentbox-custom.js");
		return js;
	}

}