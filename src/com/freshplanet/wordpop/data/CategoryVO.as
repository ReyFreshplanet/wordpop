package com.freshplanet.wordpop.data
{
	public class CategoryVO
	{
		public var name:String;
		public var phrases:Vector.<PhraseVO>;
		
		public function CategoryVO(name:String, phrasesArray:Array)
		{
			this.name = name;
			parsePhrases(phrasesArray);
		}
		
		private function parsePhrases(phrasesArray:Array):void
		{
			phrases = new Vector.<PhraseVO>();
			for (var a:int = 0; a < phrasesArray.length; a++) 
			{
				phrases.push(new PhraseVO(a, phrasesArray[a]));
			}
		}
	}
}