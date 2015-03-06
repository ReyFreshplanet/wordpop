package com.freshplanet.wordpop.core
{
	import com.freshplanet.wordpop.api.IGameTimerService;
	import com.freshplanet.wordpop.api.ILoadDataService;
	import com.freshplanet.wordpop.command.InitializeCommand;
	import com.freshplanet.wordpop.command.LoadInitialDataCommand;
	import com.freshplanet.wordpop.command.StartGameCommand;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.mediator.GameViewMediator;
	import com.freshplanet.wordpop.mediator.HomeViewMediator;
	import com.freshplanet.wordpop.mediator.LoadingViewMediator;
	import com.freshplanet.wordpop.mediator.ScreenContainerViewMediator;
	import com.freshplanet.wordpop.model.CategoryModel;
	import com.freshplanet.wordpop.model.WordPopModel;
	import com.freshplanet.wordpop.service.GameTimerService;
	import com.freshplanet.wordpop.service.LoadDataService;
	import com.freshplanet.wordpop.view.GamePlayView;
	import com.freshplanet.wordpop.view.HomeView;
	import com.freshplanet.wordpop.view.LoadingView;
	import com.freshplanet.wordpop.view.ScreenContainerView;
	import com.greensock.TweenMax;
	
	import flash.events.IEventDispatcher;
	
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.api.IInjector;
	
	public class WordPopConfig implements IConfig
	{
		[Inject] public var injector:IInjector;		
		[Inject] public var mediatorMap:IMediatorMap;		
		[Inject] public var commandMap:IEventCommandMap;
		[Inject] public var context:IContext;
		[Inject] public var dispatcher:IEventDispatcher;
		
		public function configure():void
		{
			// models
			injector.map(WordPopModel).asSingleton();
			
			// managers
			injector.map(CategoryModel).asSingleton();
			
			// commands
			commandMap.map(WordPopEvent.INITIALIZE, WordPopEvent).toCommand(InitializeCommand);
			commandMap.map(WordPopEvent.INITIALIZE_COMPLETE, WordPopEvent).toCommand(LoadInitialDataCommand);
			commandMap.map(WordPopEvent.INITIAL_DATA_PARSE_COMPLETE, WordPopEvent).toCommand(StartGameCommand);
			
			// services
			injector.map(IGameTimerService).toSingleton(GameTimerService);
			injector.map(ILoadDataService).toSingleton(LoadDataService);
			
			// mediators
			mediatorMap.map(ScreenContainerView).toMediator(ScreenContainerViewMediator);
			mediatorMap.map(LoadingView).toMediator(LoadingViewMediator);
			mediatorMap.map(HomeView).toMediator(HomeViewMediator);
			mediatorMap.map(GamePlayView).toMediator(GameViewMediator);
			
			// startup
			context.afterInitializing(init);
		}
		
		private function init():void
		{
			TweenMax.delayedCall(0.1, dispatcher.dispatchEvent, [new WordPopEvent(WordPopEvent.INITIALIZE)]);
		}
	}
}