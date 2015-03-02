package com.freshplanet.wordpop.view
{
	import com.freshplanet.wordpop.api.IView;
	
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class LoadingView extends AbstractView implements IView
	{
		private var loadingLabel:TextField;
		
		public function LoadingView(viewId:String)
		{
			super(viewId);
		}
		
		override public function build():void
		{
			loadingLabel = new TextField();
			loadingLabel.defaultTextFormat = new TextFormat("_sans", 32, 0x000000);
			loadingLabel.autoSize = TextFieldAutoSize.LEFT;
			loadingLabel.text = "Loading...";
			loadingLabel.x = 10;
			loadingLabel.y = 10;
			addChild(loadingLabel);
		}
		
		override public function clear():void
		{
			if(loadingLabel && loadingLabel.parent)
				loadingLabel.parent.removeChild(loadingLabel);
		}
		
		override public function destroy():void
		{
			clear();
			
			if(loadingLabel)
				loadingLabel = null;
		}
	}
}