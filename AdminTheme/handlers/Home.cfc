/**
* handler for the admin theme module
*/
component{

	function index(event,rc,prc){
		// Activate the module tab and 'Admin Theme' menu contribution
		prc.tabModules = true;
		prc.tabModules_AdminTheme = true;

		// View to render
		event.setView("home/index");
	}

}