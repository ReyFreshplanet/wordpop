package com.freshplanet.wordpop.model
{
	import com.freshplanet.wordpop.utils.MathUtil;
	import com.freshplanet.wordpop.data.Category;
	import com.freshplanet.wordpop.data.Phrase;

	public class CategoryModel
	{
		public var categories:Vector.<Category>;
		
		public function getRandomPhrases(amount:int):Vector.<Phrase>
		{
			var phrases:Vector.<Phrase> = new Vector.<Phrase>();
			var category:Category;
			var random:int;
			
			for (var a:int = 0; a < amount; a++) 
			{
				while(category == null)
				{
					random = MathUtil.randomRange(0, categories.length-1);
					category = categories[random];
				}
				
				phrases.push(category.getRandomPhrase());
				
				category = null;
			}
			
			return phrases;
		}
		
		public function getRandomPhrasesForCategory(currentCategory:String, amount:int):Vector.<Phrase>
		{
			var phrases:Vector.<Phrase> = new Vector.<Phrase>();
			var category:Category = getCategory(currentCategory);
			var random:int;
			var phrase:Phrase;
			
			for (var a:int = 0; a < amount; a++) 
			{
				phrase = category.getRandomPhrase();
				phrases.push(phrase);
			}
			
			category = null;
			return phrases;
		}
		
		public function getCategoryLabels():Array
		{
			var labels:Array = [];
			for (var a:int = 0; a < categories.length; a++) 
			{
				labels.push( categories[a].name );
			}
			return labels;
		}
		
		private function getCategory(name:String):Category
		{
			var category:Category;
			for (var a:int = 0; a < categories.length; a++) 
			{
				if(categories[a].name == name)
				{
					category = categories[a];
					break;
				}
			}
			return category;
		}
	}
}