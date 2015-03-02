package
{
	import com.freshplanet.wordpop.core.WordPopConfig;
	import com.freshplanet.wordpop.view.AbstractView;
	
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	
	import robotlegs.bender.bundles.mvcs.MVCSBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import com.freshplanet.wordpop.view.MainView;
	
	[SWF(frameRate="60", width="640", height="960", backgroundColor="#FFFFFF")]
	public class wordpop extends AbstractView
	{
		private var context:IContext;
		
		public function wordpop()
		{
			super(null);
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.quality = StageQuality.HIGH;
		}
		
		override protected function onAdded():void
		{
			context = new Context().install( MVCSBundle ).configure( WordPopConfig, new ContextView(this) );
			createChildren();
		}
		
		private function createChildren():void
		{
			var main:MainView = new MainView();
			addChild( main );
		}
	}
}
