package com.freshplanet.wordpop.api
{
	public interface ILoadDataService
	{
		function initialize(dataUrl:String):void;
		function load():void;
	}
}