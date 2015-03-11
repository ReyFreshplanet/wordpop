package com.freshplanet.wordpop.view.ui
{
	public class Button extends ColorButton
	{
		private var label:Label;
		
		public function Button(label:String, color:uint, numWidth:Number, numHeight:Number, labelWidthRatio:Number = 0.50)
		{
			super(color, numWidth, numHeight)
			
			this.label = new Label(label); 
			this.label.width = numWidth * labelWidthRatio;
			this.label.x = (numWidth - this.label.width) * 0.5;
			this.label.y = (numHeight - this.label.height) * 0.5;
			addChild( this.label );
		}
		
		public function get text():String
		{
			return label.text;
		}
	}
}