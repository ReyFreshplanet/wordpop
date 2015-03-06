package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.data.Phrase;
	import com.freshplanet.wordpop.utils.MathUtil;
	import com.freshplanet.wordpop.utils.UIUtils;
	
	import flash.display.Sprite;
	
	public class PhraseContainer extends Sprite
	{
		private var phrase:Phrase;
		private var wordGap:int;
		private var words:Vector.<Word>;
		
		public function PhraseContainer(phrase:Phrase, wordGap:int = 20)
		{
			this.phrase = phrase;
			this.wordGap = wordGap;
			this.words = new Vector.<Word>();
			
			build();
		}
		
		private function build():void
		{
			var word:Word;
			var xPos:Number = 0;
			var yPos:Number = 0;
			
			for (var a:int = 0; a < phrase.words.length; a++) 
			{
				word = new Word(phrase.words[a]);
				words.push(word);
				addChild(word);
				
				word.x = xPos;
				word.y = yPos;
				
				if(word.x + word.width > UIUtils.stage.stageWidth)
				{
					word.x = 0;
					word.y += word.height + 10;
				}
				
				xPos = word.x + word.width + wordGap;
				yPos = word.y;
			}
			
			if(width > UIUtils.stage.stageWidth)
				UIUtils.setWidthProportional(this, UIUtils.stage.stageWidth - 20);
		}
		
		public function revealRandomLetter():void
		{
			var foundReliableWord:Boolean = false;
			var index:int;
			var word:Word;
			
			while(foundReliableWord == false)
			{
				index = MathUtil.randomRange(0, words.length-1);
				word = words[index];
				
				if(word.allLettersRevealed)
					foundReliableWord = false;
				else
				{
					foundReliableWord = true;
					word.revealRandomLetter();
				}
			}
		}
		
		public function get numLetters():int
		{
			return phrase.numLetters;
		}
		
		public function get numWords():int
		{
			return phrase.numWords;
		}
		
		public function revealAllLetters():void
		{
			for (var a:int = 0; a < words.length; a++) 
			{
				words[a].revealAllLetters();
			}
		}
		
		public function get allLetersRevealed():Boolean
		{
			var allRevealed:Boolean = true;
			for (var a:int = 0; a < words.length; a++) 
			{
				if(!words[a].allLettersRevealed)
				{
					allRevealed = false;
					break;
				}
			}
			return allRevealed;
		}
		
		public function clear():void
		{
			for (var a:int = 0; a < words.length; a++) 
			{
				words[a].clear();
			}
			words = null;
		}
		
		public function getCurrentPhrase():String
		{
			return phrase.text;
		}
		
		public function getCurrentWrds():Vector.<Word>
		{
			return words;
		}
	}
}