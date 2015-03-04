package com.freshplanet.wordpop.model
{
	import com.freshplanet.wordpop.MathUtil;
	import com.freshplanet.wordpop.data.CategoryVO;
	import com.freshplanet.wordpop.data.PhraseVO;

	public class CategoryModel
	{
		public var categories:Vector.<CategoryVO>;
		
		public function getRandomPhrases(amount:int):Vector.<PhraseVO>
		{
			var phrases:Vector.<PhraseVO> = new Vector.<PhraseVO>();
			var random:int;
			
			for (var a:int = 0; a < amount; a++) 
			{
				random = MathUtil.randomRange(0, categories.length-1);
				phrases.push(categories[random].getRandomPhrase());
			}
			
			return phrases;
		}
	}
}