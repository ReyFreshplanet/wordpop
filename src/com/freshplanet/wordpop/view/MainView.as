package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;

	public class MainView extends AbstractView
	{
		private var currentView:IView;
		
		public function showScreen(screen:IView):void
		{
			if(currentView)
				clearCurrentScreen();
			
			log(this, "now showing", screen.id);
			
			currentView = screen;
			addChild(currentView as AbstractView);
			
			currentView.build();
		}
		
		private function clearCurrentScreen():void
		{
			var currentScreenView:AbstractView = currentView as AbstractView;
			
			currentView.clear();
			removeChild(currentScreenView);
			currentView = null;
			
			if(currentScreenView.parent)
				currentScreenView.parent.removeChild(currentScreenView);
			
			currentScreenView = null;
		}
	}
}