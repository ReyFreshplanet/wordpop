package com.freshplanet.wordpop.service
{
	import com.freshplanet.wordpop.api.ILoadDataService;
	import com.freshplanet.wordpop.data.CategoryVO;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.model.WordPopModel;
	import com.greensock.events.LoaderEvent;
	import com.greensock.loading.DataLoader;
	
	import flash.events.IEventDispatcher;

	public class LoadDataService implements ILoadDataService
	{
		[Inject] public var dispatcher:IEventDispatcher;
		[Inject] public var model:WordPopModel;
		
		private var dataLoader:DataLoader;
		private var dataUrl:String;
		
		public function initialize(dataUrl:String):void
		{
			this.dataUrl = dataUrl;
		}
		
		public function load():void
		{
			log(this, "loading initial data...");
			dataLoader = new DataLoader(dataUrl, {onComplete:handleDataLoaded, onFail:handleDataLoadFail});
			dataLoader.load();
		}
		
		private function handleDataLoadFail(event:LoaderEvent):void
		{
			log(this, "initial data load fail!");
			dispatcher.dispatchEvent(new WordPopEvent(WordPopEvent.INITIAL_DATA_LOAD_FAIL));
		}
		
		private function handleDataLoaded(event:LoaderEvent):void
		{
			log(this, "initial data load complete!");
			parse( dataLoader.content as String );
		}
		
		private function parse(data:String):void
		{
			var initialGameData:Object = JSON.parse(data);
			model.categories = new Vector.<CategoryVO>();
			
			for(var category:String in initialGameData)
			{
				model.categories.push(new CategoryVO(category, initialGameData[category]));	
			}
			
			dispatcher.dispatchEvent(new WordPopEvent(WordPopEvent.INITIAL_DATA_PARSE_COMPLETE));
			
			dataLoader.dispose(true);
			dataLoader = null;
		}
	}
}