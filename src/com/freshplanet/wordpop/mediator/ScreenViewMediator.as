package com.freshplanet.wordpop.mediator
{
	import com.freshplanet.wordpop.view.ScreenView;
	
	import robotlegs.bender.bundles.mvcs.Mediator;
	
	public class ScreenViewMediator extends Mediator
	{
		[Inject] public var view:ScreenView;
		
		override public function initialize():void
		{
			
		}
	}
}