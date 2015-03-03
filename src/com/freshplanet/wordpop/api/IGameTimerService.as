package com.freshplanet.wordpop.api
{
	public interface IGameTimerService extends IInitializable
	{
		function start():void;
		function stop():void;
	}
}