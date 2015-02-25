package com.freshplanet.wordpop.api
{
	public interface IScreen
	{
		function initialize():void;
		function build():void;
		function clear():void;
		function destroy():void;
		function set id(screenId:String):void;
		function get id():String;
	}
}