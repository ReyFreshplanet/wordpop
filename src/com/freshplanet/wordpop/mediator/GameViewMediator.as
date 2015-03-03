package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.model.CategoryModel;
	import com.freshplanet.wordpop.view.GameView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class GameViewMediator extends Mediator
	{
		[Inject] public var view:GameView;
		[Inject] public var categoryModel:CategoryModel;
		
		override public function initialize():void
		{
			addViewListener(ViewEvent.BUILD_COMPLETE, handleBuildComplete, ViewEvent);
		}
		
		private function handleBuildComplete(event:ViewEvent):void
		{
			view.phrases = categoryModel.getRandomPhrases(5);
		}
	}
}