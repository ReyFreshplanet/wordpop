package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.view.ui.WPSimpleButton;
	
	public class HomeView extends AbstractView implements IView
	{
		private var startButton:WPSimpleButton;
		public function HomeView(viewId:String=null)
		{
			super(viewId);
		}
		
		override public function build():void
		{
			startButton = new WPSimpleButton("Start Playing", 0x00FF00, 250, 60);
			startButton.onClick = startGameRequest;
			addChild( startButton );
			
			startButton.x = (stage.stageWidth - startButton.width) * 0.5;
			startButton.y = (stage.stageHeight - startButton.height) * 0.5;
		}
		
		private function startGameRequest():void
		{
			log(this, "start game request");
			dispatchEvent(new ViewEvent(ViewEvent.PLAY_GAME_REQUEST));
		}
	}
}