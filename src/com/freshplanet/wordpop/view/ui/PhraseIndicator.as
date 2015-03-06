package com.freshplanet.wordpop.view.ui
{
	public class PhraseIndicator extends Button
	{
		private var _correct:Boolean;
		
		public function PhraseIndicator(label:String)
		{
			super(label, 0xFFFFFF, 50, 15, 0.1);
			buttonMode = useHandCursor = false;
		}

		public function get correct():Boolean{ return _correct; }
		public function set correct(value:Boolean):void
		{
			_correct = value;
			color = _correct ? 0x00FF00 : 0xFF0000;
		}

	}
}