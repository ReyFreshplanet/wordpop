package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.model.CategoryModel;
	import com.freshplanet.wordpop.model.WordPopModel;
	import com.freshplanet.wordpop.view.GameView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class GameViewMediator extends Mediator
	{
		[Inject] public var view:GameView;
		[Inject] public var model:WordPopModel;
		[Inject] public var categoryModel:CategoryModel;
		
		override public function initialize():void
		{
			addViewListener(ViewEvent.BUILD_COMPLETE, handleBuildComplete, ViewEvent);
			
			addContextListener(WordPopEvent.ON_TICK, handleTimerTick, WordPopEvent);
		}
		
		private function handleTimerTick(event:WordPopEvent):void
		{
			view.updateTimer();
		}
		
		private function handleBuildComplete(event:ViewEvent):void
		{
			view.phrases = categoryModel.getRandomPhrasesForCategory(model.currentCategory, 5);
		}
	}
}