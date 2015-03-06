package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	import com.freshplanet.wordpop.data.Phrase;
	import com.freshplanet.wordpop.events.ViewEvent;
	import com.freshplanet.wordpop.utils.UIUtils;
	import com.freshplanet.wordpop.view.ui.Label;
	import com.freshplanet.wordpop.view.ui.PhraseContainer;
	import com.freshplanet.wordpop.view.ui.PhraseIndicator;
	import com.freshplanet.wordpop.view.ui.TimerBar;
	
	import flash.display.Sprite;
	
	import nid.ui.controls.VirtualKeyBoard;
	import nid.ui.controls.vkb.KeyBoardEvent;
	
	public class GameView extends AbstractView implements IView
	{
		private const TOTAL_TIME:int = 30;
		
		private var _phrases:Vector.<Phrase>;
		private var currentPhraseIndex:int = -1;
		private var currentPhrase:Phrase;
		private var wordGap:int = 20;
		private var phraseContainer:PhraseContainer;
		private var categoryTitle:Label;
		private var timerBar:TimerBar;
		private var active:Boolean;
		private var currentTime:int
		private var questionIndicatorContainer:Sprite;
		private var revealInterval:Number;
		
		public function GameView(viewId:String=null)
		{
			active = false;
			super(viewId);
		}
		
		override public function build():void
		{
			active = false;
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
				if(phraseContainer && revealInterval == 0)
				{
					revealInterval = Math.ceil(TOTAL_TIME/phraseContainer.numLetters);
				}
				
				currentTime--;
				timerBar.percent = currentTime/TOTAL_TIME;
				
				if(currentTime % revealInterval == 0)
				{
					phraseContainer.revealRandomLetter();
				}
				
				if(currentTime == 0 || phraseContainer.allLetersRevealed)
					doRoundCompleted();
			}
		}
		
		private function doRoundCompleted():void
		{
			active = false;
			phraseContainer.revealAllLetters();
		}
		
		private function nextPhrase():void
		{
			currentPhraseIndex++;
			revealInterval = 0;
			currentTime = TOTAL_TIME;
			
			currentPhrase = _phrases[currentPhraseIndex];
			currentPhrase.used = true;
			
			buildPhraseContainer();
			buildCategoryTitle();
			buildTimerBar();
			buildPhraseIndicators();
			buildVirtualKeyboard();
			
			active = true;
		}
		
		private function buildPhraseIndicators():void
		{
			if(questionIndicatorContainer)
				UIUtils.clearDisplayObject(questionIndicatorContainer);
			
			questionIndicatorContainer = new Sprite();
			addChild(questionIndicatorContainer);
			
			var spacing:int = 8;
			var indicator:PhraseIndicator;
			
			for (var a:int = 0; a < 5; a++) 
			{
				indicator = new PhraseIndicator(String(a+1));
				indicator.x = (indicator.width + spacing) * a;
				questionIndicatorContainer.addChild(indicator);
			}
			
			UIUtils.setWidthProportional(questionIndicatorContainer, timerBar.width);
			
			questionIndicatorContainer.x = timerBar.x;
			questionIndicatorContainer.y = timerBar.y + timerBar.height + 20;
		}
		
		private function showKeyboard():void
		{
			VirtualKeyBoard.getInstance().show();
		}
		
		private function buildVirtualKeyboard():void
		{
			VirtualKeyBoard.getInstance().keyboard.inputArea.fieldName.text = currentPhrase.category;
			
			if(!VirtualKeyBoard.getInstance().hasEventListener(KeyBoardEvent.ENTER))
				VirtualKeyBoard.getInstance().addEventListener(KeyBoardEvent.ENTER, handleAnswerSubmit);
		}
		
		private function buildTimerBar():void
		{
			if(timerBar)
				UIUtils.clearDisplayObject(timerBar);
			
			timerBar = new TimerBar(phraseContainer.width);
			timerBar.x = phraseContainer.x;
			timerBar.y = categoryTitle.y + categoryTitle.height + 25;
			addChild(timerBar);
		}
		
		private function buildCategoryTitle():void
		{
			if(categoryTitle)
				UIUtils.clearDisplayObject(categoryTitle);
			
			categoryTitle = new Label(currentPhrase.category);
			categoryTitle.height = stage.stageHeight * 0.1;
			categoryTitle.x = (stage.stageWidth - categoryTitle.width) * 0.5;
			categoryTitle.y = 15;
			addChild(categoryTitle);
		}
		
		private function buildPhraseContainer():void
		{
			if(phraseContainer)
			{
				phraseContainer.clear();
				UIUtils.clearDisplayObject(phraseContainer);
			}
			
			phraseContainer = new PhraseContainer(currentPhrase);
			addChild(phraseContainer);
			
			phraseContainer.x = (stage.stageWidth - phraseContainer.width) * 0.5;
			phraseContainer.y = (stage.stageHeight - phraseContainer.height) * 0.5;
		}
		
		protected function handleAnswerSubmit(event:KeyBoardEvent):void
		{
			log(this, VirtualKeyBoard.getInstance().keyboard.inputArea.targetField.text );
		}
		
		override public function clear():void
		{
			active = false;
			
			if(phraseContainer)
				UIUtils.clearDisplayObject(phraseContainer);
			
			if(categoryTitle)
				UIUtils.clearDisplayObject(categoryTitle);
			
			if(timerBar)
				UIUtils.clearDisplayObject(timerBar);
		}
	}
}