package com.freshplanet.wordpop.api
{
	public interface ITickerService extends IInitializable
	{
		function start():void;
		function stop():void;
	}
}