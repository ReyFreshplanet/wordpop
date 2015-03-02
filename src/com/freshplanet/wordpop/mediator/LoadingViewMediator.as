package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.view.LoadingView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class LoadingViewMediator extends Mediator
	{
		[Inject] public var view:LoadingView;
		
		override public function initialize():void
		{
			
		}
	}
}