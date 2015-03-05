package com.freshplanet.wordpop.view.ui
{
	import flash.display.Sprite;
	
	public class TimerBar extends Sprite
	{
		private var numWidth:Number;
		private var numHeight:Number;
		private var trackColor:uint;
		private var barColor:uint;
		private var bar:Sprite;
		private var _percent:Number;
		
		public function TimerBar(numWidth:Number = 250, numHeight:Number = 30, trackColor:uint = 0xFF0000, barColor:uint = 0x00FF00)
		{
			_percent = 1;
			
			this.numWidth = numWidth;
			this.numHeight = numHeight;
			this.trackColor = trackColor;
			this.barColor = barColor;
			
			bar = new Sprite();
			addChild(bar);
			
			build();
		}
		
		private function build():void
		{
			graphics.clear();
			graphics.beginFill(trackColor);
			graphics.drawRect(0, 0, numWidth, numHeight);
			graphics.endFill();
			
			bar.graphics.clear();
			bar.graphics.beginFill(barColor);
			bar.graphics.drawRect(0, 0, numWidth, numHeight);
			bar.graphics.endFill();
			
			bar.width = numWidth * _percent;
		}

		public function get percent():Number
		{
			return _percent;
		}

		public function set percent(value:Number):void
		{
			_percent = value;
			bar.width = numWidth * _percent;
		}

	}
}