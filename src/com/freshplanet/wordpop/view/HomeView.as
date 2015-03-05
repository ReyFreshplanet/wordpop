package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.view.ui.Button;
	
	import flash.display.Sprite;
	
	public class HomeView extends AbstractView implements IView
	{
		private var startButton:Button;
		private var buttonContainer:Sprite;
		
		public function HomeView(viewId:String=null)
		{
			super(viewId);
		}
		
		override public function build():void
		{
			dispatchEvent(new ViewEvent(ViewEvent.BUILD_COMPLETE));
		}
		
		public function setCategories(categories:Array):void
		{
			startButton = new Button("Shuffle!", 0x00FF00, 250, 60, 0.5);
			startButton.onClick = shuffleCategoriesRequest;
			addChild( startButton );
			
			startButton.x = (stage.stageWidth - startButton.width) * 0.5;
			startButton.y = stage.stageHeight - startButton.height - 50;
			
			buttonContainer = new Sprite();
			addChild(buttonContainer);
			
			var button:Button;
			for (var a:int = 0; a < categories.length; a++) 
			{
				button = new Button(categories[a], 0xFFACEE, 450, 60);
				button.onClick = handleCategorySelected;
				button.y = a * (button.height + 25);
				buttonContainer.addChild( button );
			}
			button = null;
			
			buttonContainer.x = (stage.stageWidth - buttonContainer.width) * 0.5;
			buttonContainer.y = (startButton.y - buttonContainer.height) * 0.5;
		}
		
		private function handleCategorySelected(button:Button):void
		{
			log(this, "play game request");
			dispatchEvent(new ViewEvent(ViewEvent.PLAY_GAME_REQUEST, button.text));
		}
		
		private function shuffleCategoriesRequest(button:Button):void
		{
			log(this, "shuffle categories request");
			dispatchEvent(new ViewEvent(ViewEvent.SHUFFLE_CATEGORIES_REQUEST));
		}
	}
}