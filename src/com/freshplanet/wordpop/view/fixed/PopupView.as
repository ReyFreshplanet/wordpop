package com.freshplanet.wordpop.view.fixed
{
	import com.freshplanet.wordpop.utils.UIUtils;
	import com.freshplanet.wordpop.view.AbstractView;
	import com.freshplanet.wordpop.view.ui.Popup;

	public class PopupView extends AbstractView
	{
		private var popup:Popup;
		
		public function PopupView()
		{
		
		}
		
		public function showPopup(title:String, message:String, button:String, onClose:Function=null):void
		{
			mouseEnabled = true;
			
			graphics.clear();
			graphics.beginFill(0x000000, 0.4);
			graphics.drawRect(0, 0, UIUtils.stage.stageWidth, UIUtils.stage.stageHeight);
			graphics.endFill();
			
			popup = new Popup(title, message, button, onClose);
			addChild(popup);
		}
		
		public function removePopup():void
		{
			mouseEnabled = false;
			
			graphics.clear();
			
			if(popup)
			{
				UIUtils.removeDisplayObject(popup);
				popup = null;
			}
		}
	}
}