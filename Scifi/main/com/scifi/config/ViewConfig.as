/**
 * Created by mikhailkuts on 03.10.14.
 */
package com.scifi.config
{

import com.scifi.view.chat.ChatMediator;
import com.scifi.view.chat.ChatView;
import com.scifi.view.chat.communicator.types.DirectCommunicatorMediator;
import com.scifi.view.chat.communicator.types.DirectCommunicatorView;
import com.scifi.view.chat.roster.RosterMediator;
import com.scifi.view.chat.roster.RosterView;
import com.scifi.view.chat.tabs.CommunicatorsTabsMediator;
import com.scifi.view.chat.tabs.CommunicatorsTabsView;
import com.scifi.view.chat.tabs.types.DirectCommunicatorTabMediator;
import com.scifi.view.chat.tabs.types.DirectCommunicatorTabView;
import com.scifi.view.screens.game.GameMediator;
import com.scifi.view.screens.game.GameView;
import com.scifi.view.starling.StarlingStageMediator;
import com.scifi.view.starling.StarlingStageView;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IInjector;

public class ViewConfig implements IConfig
{

	[Inject]
	public var mediatorMap:IMediatorMap;

	[Inject]
	public var injector:IInjector;

	public function configure():void
	{
		mapView();
	}

	private function mapView():void
	{
		mediatorMap.map(StarlingStageView).toMediator(StarlingStageMediator);
		mediatorMap.map(GameView).toMediator(GameMediator);

		mediatorMap.map(ChatView).toMediator(ChatMediator);
		mediatorMap.map(CommunicatorsTabsView).toMediator(CommunicatorsTabsMediator);
		mediatorMap.map(DirectCommunicatorView).toMediator(DirectCommunicatorMediator);
		mediatorMap.map(DirectCommunicatorTabView).toMediator(DirectCommunicatorTabMediator);
		mediatorMap.map(RosterView).toMediator(RosterMediator);
	}

}
}
