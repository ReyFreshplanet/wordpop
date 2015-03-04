package com.freshplanet.wordpop.data
{
	import com.freshplanet.wordpop.MathUtil;

	public class CategoryVO
	{
		public var name:String;
		public var phrases:Vector.<PhraseVO>;
		public var usedPhrases:Vector.<PhraseVO>;
		
		public function CategoryVO(name:String, phrasesArray:Array)
		{
			this.name = name;
			parsePhrases(phrasesArray);
			usedPhrases = new Vector.<PhraseVO>();
		}
		
		private function parsePhrases(phrasesArray:Array):void
		{
			phrases = new Vector.<PhraseVO>();
			for (var a:int = 0; a < phrasesArray.length; a++) 
			{
				phrases.push(new PhraseVO(a, phrasesArray[a], name));
			}
		}
		
		public function getRandomPhrase():PhraseVO
		{
			if(isEmpty)
				return null;
			
			var index:int = MathUtil.randomRange(0, phrases.length-1);
			var phrase:PhraseVO = phrases.splice(index, 1)[0];
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