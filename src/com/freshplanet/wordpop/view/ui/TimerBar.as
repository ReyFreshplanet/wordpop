package com.freshplanet.wordpop.view.ui
{
	import flash.display.Sprite;
	
	public class TimerBar extends Sprite
	{
		public var totalTime:int;
		
		private var _currentTime:int;
		
		private var numWidth:Number;
		private var numHeight:Number;
		private var trackColor:uint;
		private var barColor:uint;
		private var bar:Sprite;
		private var timeLabel:Label;
		private var scoreLabel:Label;
		
		public function TimerBar(numWidth:Number = 250, numHeight:Number = 30, trackColor:uint = 0xFF0000, barColor:uint = 0x00FF00)
		{
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
			
			timeLabel = new Label("00:00");
			timeLabel.height = numHeight - 10;
			timeLabel.x = 5;
			timeLabel.y = 5;
			addChild(timeLabel);
			
			scoreLabel = new Label("100 pts");
			scoreLabel.height = numHeight - 10;
			scoreLabel.x = width - scoreLabel.width - 5;
			scoreLabel.y = 5;
			addChild(scoreLabel);
		}

		public function get currentTime():int
		{
			return _currentTime;
		}

		public function set currentTime(value:int):void
		{
			_currentTime = value;
			_currentTime = _currentTime < 0 ? 0 : _currentTime;
			
			bar.width = numWidth * (_currentTime/totalTime);
			timeLabel.text = "00:" + (_currentTime < 10 ? "0" + _currentTime : _currentTime);
			
			scoreLabel.text = String(Math.ceil(100 * (_currentTime/totalTime))) + " pts";
			scoreLabel.x = width - scoreLabel.width - 5;
		}
		
		public function get score():int
		{
			return int(scoreLabel.text.split(" ")[0]);
		}
	}
}