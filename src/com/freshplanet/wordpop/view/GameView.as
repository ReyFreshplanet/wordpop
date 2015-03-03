package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.data.PhraseVO;
	import com.freshplanet.wordpop.events.ViewEvent;
	
	public class GameView extends AbstractView implements IView
	{
		private var _phrases:Vector.<PhraseVO>;
		
		public function GameView(viewId:String=null)
		{
			super(viewId);
		}
		
		override public function build():void
		{
			dispatchEvent(new ViewEvent(ViewEvent.BUILD_COMPLETE));
		}
		
		public function set phrases(value:Vector.<PhraseVO>):void
		{
			_phrases = value;
			
		}
	}
}