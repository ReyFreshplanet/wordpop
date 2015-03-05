package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.model.CategoryModel;
	import com.freshplanet.wordpop.model.ViewNames;
	import com.freshplanet.wordpop.model.WordPopModel;
	import com.freshplanet.wordpop.view.HomeView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class HomeViewMediator extends Mediator
	{
		[Inject] public var view:HomeView;
		[Inject] public var model:WordPopModel;
		[Inject] public var categoryModel:CategoryModel;
		
		override public function initialize():void
		{
			addViewListener(ViewEvent.PLAY_GAME_REQUEST, handlPlayGameRequest, ViewEvent);
			addViewListener(ViewEvent.BUILD_COMPLETE, handleBuildComplete, ViewEvent);
		}
		
		private function handleBuildComplete(event:ViewEvent):void
		{
			view.setCategories(categoryModel.getCategoryLabels());
		}
		
		private function handlPlayGameRequest(event:ViewEvent):void
		{
			model.currentCategory = event.data as String;
			model.currentView = ViewNames.GAME_VIEW;
		}
	}
}