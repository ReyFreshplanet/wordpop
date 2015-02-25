package com.freshplanet.wordpop.core
{
	import com.freshplanet.wordpop.api.ITickerService;
	import com.freshplanet.wordpop.command.InitializeCommand;
	import com.freshplanet.wordpop.events.WordPopEvent;
	import com.freshplanet.wordpop.mediator.ScreenViewMediator;
	import com.freshplanet.wordpop.model.GameModel;
	import com.freshplanet.wordpop.service.TickerService;
	import com.freshplanet.wordpop.view.ScreenView;
	
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
			injector.map(GameModel).asSingleton();
			
			// managers
			
			// commands
			commandMap.map(WordPopEvent.INITIALIZE, WordPopEvent).toCommand(InitializeCommand);
			
			// services
			injector.map(ITickerService).toSingleton(TickerService);
			
			// mediators
			mediatorMap.map(ScreenView).toMediator(ScreenViewMediator);
			
			// startup
			context.afterInitializing( init );	
		}
		
		private function init():void
		{
			dispatcher.dispatchEvent(new WordPopEvent( WordPopEvent.INITIALIZE ));
		}
	}
}