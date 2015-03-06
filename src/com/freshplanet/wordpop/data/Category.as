package com.freshplanet.wordpop.data
{
	import com.freshplanet.wordpop.utils.MathUtil;

	public class Category
	{
		public var name:String;
		public var phrases:Vector.<Phrase>;
		public var usedPhrases:Vector.<Phrase>;
		
		public function Category(name:String, phrasesArray:Array)
		{
			this.name = name;
			parsePhrases(phrasesArray);
			usedPhrases = new Vector.<Phrase>();
		}
		
		private function parsePhrases(phrasesArray:Array):void
		{
			phrases = new Vector.<Phrase>();
			for (var a:int = 0; a < phrasesArray.length; a++) 
			{
				phrases.push(new Phrase(a, phrasesArray[a], name));
			}
		}
		
		public function getRandomPhrase():Phrase
		{
			if(isEmpty)
				return null;
			
			var index:int = MathUtil.randomRange(0, phrases.length-1);
			var phrase:Phrase = phrases.splice(index, 1)[0];
			phrase.used = true;
			
			usedPhrases.push(phrase);
			
			return phrase;
		}
		
		public function get isEmpty():Boolean
		{
			return phrases.length == 0;
		}
	}
}