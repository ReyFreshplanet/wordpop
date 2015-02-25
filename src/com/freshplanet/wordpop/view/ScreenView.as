package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IScreen;

	public class ScreenView extends BaseView
	{
		private var currentScreen:IScreen;
		
		public function showScreen(screen:IScreen):void
		{
			if(currentScreen)
				clearScreen(currentScreen);
			
			currentScreen = screen;
			addChild(currentScreen as BaseView);
			currentScreen.initialize();
		}
		
		private function clearScreen(screen:IScreen):void
		{
			screen.clear();
			removeChild(screen as BaseView);
			currentScreen = null;
		}
	}
}