package com.freshplanet.wordpop.view.fixed
{
	import com.freshplanet.wordpop.api.IView;
	
	import flash.display.Sprite;
	import com.freshplanet.wordpop.view.AbstractView;

	public class ScreenContainerView extends AbstractView
	{
		private var currentView:IView;
		private var container:Sprite;
		
		public function ScreenContainerView()
		{
			container = new Sprite();
			addChild(container);
		}
		
		public function showScreen(screen:IView):void
		{
			if(currentView)
				clearCurrentScreen();
			
			log(this, "now showing", screen.id);
			
			currentView = screen;
			container.addChild(currentView as AbstractView);
			
			currentView.build();
		}
		
		private function clearCurrentScreen():void
		{
			var currentScreenView:AbstractView = currentView as AbstractView;
			
			currentView.clear();
			container.removeChild(currentScreenView);
			currentView = null;
			
			if(currentScreenView.parent)
				currentScreenView.parent.removeChild(currentScreenView);
			
			currentScreenView = null;
		}
	}
}