package com.freshplanet.wordpop.data
{
	public class PhraseVO
	{
		public var id:int;
		public var text:String;
		public var words:Array;
		public var numWords:uint;
		
		public var used:Boolean = false;
		
		public function PhraseVO(id:int, text:String)
		{
			this.id = id;
			this.text = text;
			
			words = text.split(" ");
			numWords = words.length;
		}
	}
}