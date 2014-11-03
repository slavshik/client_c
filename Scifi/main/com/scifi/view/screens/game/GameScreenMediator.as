/**
 * Created with IntelliJ IDEA.
 * User: Neste
 * Date: 13.12.12
 * Time: 14:23
 * To change this template use File | Settings | File Templates.
 */

package com.scifi.view.screens.game {

	import feathers.layout.AnchorLayout;
	import feathers.layout.AnchorLayoutData;

	import org.as3commons.logging.api.ILogger;
	import org.as3commons.logging.api.getLogger;
	import org.igniterealtime.xiff.events.LoginEvent;

	import robotlegs.extensions.starlingFeathers.impl.FeathersMediator;

	import starling.events.Event;

	public class GameScreenMediator extends FeathersMediator {
		private static const log:ILogger = getLogger(GameScreenMediator);

		public static const NAME:String = "LoginScreenMediator";

		[Inject]
		public var screen:GameScreen;

		[Inject]
		public var chat:IChatService;

		override public function initializeComplete():void {
			screen.btn1.addEventListener(Event.TRIGGERED, btn_handler);
			screen.btn2.addEventListener(Event.TRIGGERED, btn_handler);
			screen.btn3.addEventListener(Event.TRIGGERED, btn_handler);
			chat.model.addEventListener(LoginEvent.LOGIN, onLogin);

			layout();
		}

		private function layout():void {
			screen.layout = new AnchorLayout();
			var btn1:AnchorLayoutData = new AnchorLayoutData();
			var btn2:AnchorLayoutData = new AnchorLayoutData();
			var btn3:AnchorLayoutData = new AnchorLayoutData();
			var rosterView:AnchorLayoutData = new AnchorLayoutData();
			btn1.left = btn2.left = btn3.left = 0;
			btn2.leftAnchorDisplayObject = screen.btn1;
			btn3.leftAnchorDisplayObject = screen.btn2;
			rosterView.left = 0;
			rosterView.leftAnchorDisplayObject = screen.btn3;
			screen.btn1.layoutData = btn1;
			screen.btn2.layoutData = btn2;
			screen.btn3.layoutData = btn3;
			screen.rosterView.layoutData = rosterView;
		}

		private function onLogin(event:LoginEvent):void {
			screen.addChild(screen.chatView);
		}

		private function btn_handler(event:Event):void {
			hideBtns();
			switch(event.currentTarget) {
				case screen.btn1:
					chat.controller.connect("kvinty@localhost", "2gret37nidro");
					break;
				case screen.btn2:
					chat.controller.connect("external@localhost", "2gret37nidro");
					break;
				case screen.btn3:
					chat.controller.connect("kvinty2@localhost", "2gret37nidro");
					break;
			}
		}

		private function hideBtns():void {
			screen.btn1.isEnabled = false;
			screen.btn2.isEnabled = false;
			screen.btn3.isEnabled = false;
		}

	}
}
