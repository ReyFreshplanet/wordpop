package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.utils.MathUtil;
	
	import flash.display.Sprite;
	
	public class Word extends Sprite
	{
		private const letterSpacing:int = 2;
		private const vowels:Array = ["a", "e", "i", "o", "u"];
		
		private var value:String;
		private var letters:Vector.<Letter>;
		
		public function Word(word:String)
		{
			value = word;
			
			var arrLetters:Array = value.split("");
			var xPosition:Number = 0;
			var letter:Letter;
			
			letters = new Vector.<Letter>();
			
			for (var a:int = 0; a < arrLetters.length; a++) 
			{
				xPosition = a == 0 ? 0 : (letterSpacing + letter.width) * a;
				
				letter = new Letter(arrLetters[a]);
				letter.x = xPosition;
				addChild( letter);
				
				letters.push( letter );
			}
			
			letter = null;
		}
		
		public function revealFirstAndLastLetters():void
		{
			if(value.length > 3)
			{
				revealLetter(0);
				revealLetter(letters.length-1);
			}
		}
		
		public function revealAllLetters():void
		{
			for (var a:int = 0; a < letters.length; a++) 
			{
				revealLetter(a);
			}
		}
		
		public function revealVowels():void
		{
			for (var a:int = 0; a < letters.length; a++) 
			{
				if( vowels.indexOf(letters[a].value.toLowerCase()) > -1 )
				{
					revealLetter(a);
				}
			}
		}
		
		public function revealRandomLetter():void
		{
			var foundReliableLetter:Boolean = false;
			var randomIndex:int;
			
			while(foundReliableLetter == false)
			{
				randomIndex = MathUtil.randomRange(0, letters.length-1);
				
				if(letters[randomIndex].isRevealed)
					foundReliableLetter = false;
				else
				{
					foundReliableLetter = true;
					revealLetter(randomIndex);
				}
			}
		}
		
		private function revealLetter(letterIndex:int):void
		{
			var letter:Letter = letters[letterIndex];
			letter.reveal();
		}
		
		public function get allLettersRevealed():Boolean
		{
			var allShowing:Boolean = true;
			for (var a:int = 0; a < letters.length; a++) 
			{
				if(!letters[a].isRevealed)
				{
					allShowing = false;
					break;
				}
			}
			return allShowing;
		}
		
		public function get letterCount():int
		{
			return letters.length;
		}
		
		public function get text():String
		{
			return value;
		}
		
		public function clear():void
		{
			for (var a:int = 0; a < letters.length; a++) 
			{
				letters[a].clear();
			}
			letters = null;
		}
	}
}