package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.view.ScreenContainerView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class ScreenContainerViewMediator extends Mediator
	{
		[Inject] public var view:ScreenContainerView;
		
		override public function initialize():void
		{
			addContextListener(WordPopEvent.SHOW_SCREEN, handleShowScreenRequest, WordPopEvent);
		}
		
		private function handleShowScreenRequest(event:WordPopEvent):void
		{
			view.showScreen(event.data.view as IView);
		}
	}
}