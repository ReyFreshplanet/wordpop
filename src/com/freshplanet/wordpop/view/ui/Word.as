package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.MathUtil;
	
	import flash.display.Sprite;
	
	public class Word extends Sprite
	{
		private const letterSpacing:int = 2;
		
		private var value:String;
		private var letters:Vector.<Letter>;
		private var revealedLetters:Vector.<Letter>;
		
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
			revealedLetters = new Vector.<Letter>();
		}
		
		public function revealRandomLetter():void
		{
			var randomIndex:int = MathUtil.randomRange(0, letters.length-1);
			var letter:Letter = letters[randomIndex];
			
			revealedLetters.push( letters.splice(randomIndex, 1)[0] );
			
			letter.reveal();
		}
		
		public function get allReveald():Boolean
		{
			return letters.length == 0;
		}
	}
}