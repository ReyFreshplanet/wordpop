package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.data.Phrase;
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.view.ui.Label;
	import com.freshplanet.wordpop.view.ui.TimerBar;
	import com.freshplanet.wordpop.view.ui.Word;
	
	import flash.display.Sprite;
	
	import nid.ui.controls.VirtualKeyBoard;
	import nid.ui.controls.vkb.KeyBoardEvent;
	
	public class GameView extends AbstractView implements IView
	{
		private const TOTAL_TIME:int = 60;
		
		private var _phrases:Vector.<Phrase>;
		private var currentPhraseIndex:int = -1;
		private var currentPhrase:Phrase;
		private var wordGap:int = 20;
		private var phraseContainer:Sprite;
		private var categoryTitle:Label;
		private var timerBar:TimerBar;
		private var active:Boolean;
		private var currentTime:int
		
		public function GameView(viewId:String=null)
		{
			active = false;
			super(viewId);
		}
		
		override public function build():void
		{
			active = false;
			currentTime = 60;
			dispatchEvent(new ViewEvent(ViewEvent.BUILD_COMPLETE));
		}
		
		public function set phrases(value:Vector.<Phrase>):void
		{
			_phrases = value;
			nextPhrase();
		}
		
		public function updateTimer():void
		{
			if(active)
			{
				currentTime--;
				timerBar.percent = currentTime/TOTAL_TIME;
			}
		}
		
		private function nextPhrase():void
		{
			if(phraseContainer)
				clearContainer(phraseContainer);
			
			currentPhraseIndex++;
			
			currentPhrase = _phrases[currentPhraseIndex];
			currentPhrase.used = true;
			
			phraseContainer = new Sprite();
			addChild(phraseContainer);
			
			var word:Word;
			var xPos:Number = 0;
			var yPos:Number = 0;
			
			for (var a:int = 0; a < currentPhrase.words.length; a++) 
			{
				word = new Word(currentPhrase.words[a]);
				phraseContainer.addChild(word);
				
				word.x = xPos;
				word.y = yPos;
				
				if(word.x + word.width > stage.stageWidth)
				{
					word.x = 0;
					word.y += word.height + 10;
				}
				
				xPos = word.x + word.width + wordGap;
				yPos = word.y;
			}
			
			phraseContainer.x = (stage.stageWidth - phraseContainer.width) * 0.5;
			phraseContainer.y = (stage.stageHeight - phraseContainer.height) * 0.5;
			
			if(!categoryTitle)
			{
				categoryTitle = new Label(currentPhrase.category);
				categoryTitle.height = stage.stageHeight * 0.1;
				categoryTitle.x = (stage.stageWidth - categoryTitle.width) * 0.5;
				categoryTitle.y = 15;
				addChild(categoryTitle);
			}
			
			if(!timerBar)
			{
				timerBar = new TimerBar(phraseContainer.width);
				timerBar.x = phraseContainer.x;
				timerBar.y = categoryTitle.y + categoryTitle.height + 25;
				addChild(timerBar);
			}
			
			active = true;
			
			VirtualKeyBoard.getInstance().keyboard.inputArea.fieldName.text = currentPhrase.category;
			VirtualKeyBoard.getInstance().addEventListener(KeyBoardEvent.ENTER, handleAnswerSubmit);
			VirtualKeyBoard.getInstance().show();
		}
		
		protected function handleAnswerSubmit(event:KeyBoardEvent):void
		{
			log(this, VirtualKeyBoard.getInstance().referenceText );
		}
		
		private function clearContainer(phraseContainer:Sprite):void
		{
			// TODO: clear phrases in the container
			removeChild(phraseContainer);
			phraseContainer = null;
		}
		
		override public function clear():void
		{
			
		}
	}
}