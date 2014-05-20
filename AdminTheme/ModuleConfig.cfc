/**
********************************************************************************
Copyright 2014 Computer Know How, www.compknowhow.com
********************************************************************************

Author: Seth Engen
Description: This module sets up a custom admin theme in ContentBox.

********************************************************************************
**/
component {

	// Module Properties
	this.title 				= "AdminTheme";
	this.author 			= "Computer Know How, LLC";
	this.webURL 			= "http://www.compknowhow.com";
	this.description 		= "Custom theme for the ContentBox Admin";
	this.version			= "1.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup 	= true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint			= "AdminTheme";

	function configure(){

		// SES Routes
		routes = [
			// Module Entry Point
			{pattern="/", handler="home",action="index"},
			// Convention Route
			{pattern="/:handler/:action?"}
		];

	}

	/**
	* Fired when the module is registered and activated.
	*/
	function onLoad(){
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
		var adminThemeService = controller.getWireBox().getInstance("adminThemeService@cb");
		var settingService = controller.getWireBox().getInstance("SettingService@cb");

		// Add menu contribution
		menuService.addSubMenu(topMenu=menuService.MODULES,
								name="AdminTheme",
								label="Admin Theme",
								href="#menuService.buildModuleLink('AdminTheme','home')#");

		// Register my custom theme
		var myCustomTheme = controller.getWireBox().getInstance( "contentbox.modules.AdminTheme.includes.theme.CustomTheme" );
		adminThemeService.registerTheme( myCustomTheme );

		// Change the setting to our new custom  ContentBox theme
		var oSetting = settingService.findWhere( { name="cb_admin_theme" } );
		oSetting.setValue( "contentbox-custom" );
		settingService.save( oSetting );

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();
	}

	/**
	* Fired when the module is activated by ContentBox
	*/
	function onActivate(){

	}

	/**
	* Fired when the module is unregistered and unloaded
	*/
	function onUnload(){
		var adminThemeService = controller.getWireBox().getInstance("adminThemeService@cb");
		var settingService = controller.getWireBox().getInstance("SettingService@cb");
		var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");

		// Remove menu contribution
		menuService.removeSubMenu(topMenu=menuService.MODULES, name="AdminTheme");

		// Change the setting to the default ContentBox theme
		var oSetting = settingService.findWhere( { name="cb_admin_theme" } );
		oSetting.setValue( "contentbox-default" );
		settingService.save( oSetting );

		// Flush the settings cache so our new settings are reflected
		settingService.flushSettingsCache();

		// Unregister my custom theme
		adminThemeService.unregisterTheme( "contentbox-custom" ); //ContentBox Custom
	}

	/**
	* Fired when the module is deactivated by ContentBox
	*/
	function onDeactivate(){

	}

}