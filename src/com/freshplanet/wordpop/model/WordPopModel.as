package com.freshplanet.wordpop.model
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.view.GamePlayView;
	import com.freshplanet.wordpop.view.HomeView;
	import com.freshplanet.wordpop.view.LoadingView;
	
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class WordPopModel
	{
		[Inject] public var dispatcher:IEventDispatcher;
		[Inject] public var categoryModel:CategoryModel;
		
		public var version:String = "0.0.178";
		public var dataUrl:String = "./data/wordpop_sample_categories.json";
		public var views:Dictionary;
		public var initialGameData:Object;
		public var currentCategory:String;
		
		private var _currentView:String;
		
		public function initialize():void
		{
			var viewArray:Array = [];
			viewArray.push(
				{key:ViewNames.LOADING_VIEW, value:new LoadingView( ViewNames.LOADING_VIEW )},
				{key:ViewNames.HOME_VIEW, value:new HomeView( ViewNames.HOME_VIEW )},
				{key:ViewNames.GAME_VIEW, value:new GamePlayView( ViewNames.GAME_VIEW )}
			);
			
			views = new Dictionary();
			
			for (var a:int = 0; a < viewArray.length; a++) 
			{
				views[viewArray[a].key] = viewArray[a].value;
				views[viewArray[a].key].initialize();
			}
			
			log(this, "initialized");
		}
		
		public function getCurrentViewInstance():IView
		{
			return views[currentView];
		}

		public function get currentView():String{ return _currentView; }
		public function set currentView(value:String):void
		{
			if(_currentView != value)
			{
				log(this, "setting current view to", value);
				
				_currentView = value;
				dispatcher.dispatchEvent(new WordPopEvent(WordPopEvent.SHOW_SCREEN, {id:value, view:views[value]}));
			}
			else
			{
				log(this, value, "is aleady showing.");
			}
		}
	}
}