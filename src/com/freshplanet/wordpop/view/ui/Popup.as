package com.freshplanet.wordpop.view.ui
{
	import com.freshplanet.wordpop.utils.UIUtils;
	
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Popup extends Sprite
	{
		private var title:String;
		private var message:String;
		private var onClick:Function;
		private var actionButtonText:String;
		private var titleLabel:Label;
		private var actionButton:Button;
		private var bodyText:TextField;
		
		public function Popup(title:String, message:String, actionButtonText:String, onClickHandler:Function=null)
		{
			this.title = title;
			this.message = message;
			this.onClick = onClickHandler;
			this.actionButtonText = actionButtonText;
			
			build();
		}
		
		private function build():void
		{
			graphics.clear();
			graphics.lineStyle(5, 0x000000);
			graphics.beginFill(0xeeffbb);
			graphics.drawRect(0, 0, UIUtils.stage.stageWidth - 100, UIUtils.stage.stageHeight * 0.25);
			graphics.endFill();
			
			titleLabel = new Label(title);
			titleLabel.width = this.width * 0.25;
			titleLabel.y = 10;
			titleLabel.x = (this.width - titleLabel.width) * 0.5;
			addChild(titleLabel);
			
			actionButton = new Button(actionButtonText, 0xFFFF00, this.width * 0.15, 30, .35);
			actionButton.onClick = handleActionButtonClicked;
			actionButton.y = this.height - actionButton.height - 20;
			actionButton.x = (this.width - actionButton.width) * 0.5;
			addChild(actionButton);
			
			bodyText = new TextField();
			bodyText.defaultTextFormat = new TextFormat("_sans", 18, 0x000000);
			bodyText.multiline = true;
			bodyText.wordWrap = true;
			bodyText.width = this.width - 30;
			bodyText.height = (actionButton.y - 20) - (titleLabel.y + titleLabel.height + 20);
			bodyText.x = 15;
			bodyText.y = titleLabel.y + titleLabel.height + 20;
			bodyText.text = message;
			addChild(bodyText);
			
			UIUtils.centerTo(this, UIUtils.stage);
		}
		
		private function handleActionButtonClicked(button:Button):void
		{
			if(onClick != null)
				onClick.call();
		}
		
		public function clear():void
		{
			// TODO Auto Generated method stub
			
		}
	}
}