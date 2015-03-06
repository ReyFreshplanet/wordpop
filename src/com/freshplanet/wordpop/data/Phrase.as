package com.freshplanet.wordpop.data
{
	public class Phrase
	{
		public var id:int;
		public var text:String;
		public var words:Array;
		public var numWords:uint;
		public var category:String;
		public var used:Boolean = false;
		
		public function Phrase(id:int, text:String, category:String)
		{
			this.id = id;
			this.category = category;
			this.text = text;
			
			words = text.split(" ");
			numWords = words.length;
		}
		
		public function get numLetters():int
		{
			var count:int = 0;
			for (var a:int = 0; a < words.length; a++) 
			{
				count += String(words[a]).length;
			}
			return count;
		}
	}
}