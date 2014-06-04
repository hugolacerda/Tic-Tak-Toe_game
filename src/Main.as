package
{
	import flash.display.Sprite; // imports the sprite for the display
	import flash.events.Event; // imports the flash events for the Enter Frames
	import flash.events.MouseEvent; // imports the flash events for clickable items
	import flash.text.TextColorType; // imports for the text color
	import flash.text.TextField; // imports for the text field
	import flash.text.TextFormat; // imports for formating the text

	[SWF(width = "500", height = "500", backgroundColor = "#000000")] // background is black, and width and height are even
	public class Main extends Sprite // the main class for the full program
	{
		private var _restart:RestartBtn = new RestartBtn(); // property of the restart button
		private var _textstyle:TextFormat = new TextFormat("Impact"); // textstyle sets the font 
		private var _player:TextField = new TextField(); // property for the TextField
		private var _tile:Array = []; // sets up the tiles as Arrays
		private var _turn:Boolean = true; // determins who's turn it is
	
		public function Main() // the main public function
		{
			_restart.x=250; // puts the restart 250 pixels down
			_restart.y = 200; // puts the restart button 200 to the side
			
			for(var j:uint=0; j<3; j++) // sets the rows
			{
				for(var i:uint=0; i<3; i++) // sets the columns
				{
					var p:Tile = new Tile(); // sets p for the Tile object
					this.addChild(p); // adds the object to the stage
					p.x = 110 + (p.width + 40) * i; // add space between the column and puts it based on the cordinates
					p.y = 70 + (p.width + 37) * j; // adds space between the rows and puts locates it based on the cordinates
					_tile.push(p); // puts all the p Tiles in the Tile array
					p.addEventListener(MouseEvent.CLICK, updateAll); // makes the tiles clickable
					//p.addEventListener(Event.ENTER_FRAME, checkWinner);
					
				}
				
			var bg:Board = new Board(); // sets the boards int he background
			this.addChild(bg); // adds the background to the stage
			bg.x = 250; // moves it down
			bg.y = 200; // moves it to the side
			
		
		this.addChild(_player); // add the _player to the stage
	    _player.textColor = 0xff00; // sets the color neon green
		_player.text = "Player one's turn"; // makes hte text write out whos turn it is
		_player.setTextFormat(_textstyle); // add the formating to the text
		_player.x = 165; // moves the test to the bottom
		_player.y = 400; // then to the side to place it in the center
		_player.scaleX = 2; // doubles its size so it will be readable
		_player.scaleY = 2; // doubles its vertical size to match the X size
				
			}	
				
			
		}
		private function updateAll(event:MouseEvent):void // upadate all executes the gameplay regarding what happens when the players engage the game
		{
			if(_turn == true) // conditional for when the boolean is true
			{ 
			event.currentTarget.gotoAndStop(3); //  puts the tile click to be an X
			event.currentTarget.removeEventListener(MouseEvent.CLICK, updateAll); // makes the target clickable
			_player.text = "Player two's turn"; // tells who's turn it is
			_player.setTextFormat(_textstyle);// adds text format to the text
			_turn = false; // sets the boolean to false showing that the player's turn has ended
			checkWinner(); // executes the fucntio to check who one after the turn 
			}else{ // the conditional for everythign else meaning the second player's turn is up
				event.currentTarget.gotoAndStop(2); // puts the tile to be on O on click
				event.currentTarget.removeEventListener(MouseEvent.CLICK, updateAll); // makes the tile clickable
				_player.text = "Player one's turn"; //  tells the user that its player one's turn
				_player.setTextFormat(_textstyle); // adds style to the text
				_turn = true; // sets the boolean back to true so that it can be player one's turn again
				checkWinner(); // checks for winners at the end of the turn
			}
					
		}
		private function checkWinner():void // the function for checking the winner
		{
			if((_tile[0].currentFrame == 3 && _tile[1].currentFrame == 3 && _tile[2].currentFrame == 3) || // player one wins horizontally (row 1) works
				
				(_tile[3].currentFrame == 3 && _tile[4].currentFrame == 3 && _tile[5].currentFrame == 3) || // player one wins horizontally (row 2) works
				
				(_tile[6].currentFrame == 3 && _tile[7].currentFrame == 3 && _tile[8].currentFrame == 3) || // player one wins horizontally (row 3) works
				
				(_tile[0].currentFrame == 3 && _tile[3].currentFrame == 3 && _tile[6].currentFrame == 3) || // player one wins vertically (column 1) works
				
				(_tile[1].currentFrame == 3 && _tile[4].currentFrame == 3 && _tile[7].currentFrame == 3) ||// player one wins vertically (column 2) works
				
				(_tile[2].currentFrame == 3 && _tile[5].currentFrame == 3 && _tile[8].currentFrame == 3) ||// player one wins vertically (column 3) works
				
				(_tile[0].currentFrame == 3 && _tile[4].currentFrame == 3 && _tile[8].currentFrame == 3) || // player one wins diagnally works
				
				(_tile[2].currentFrame == 3 && _tile[4].currentFrame == 3 && _tile[6].currentFrame == 3) // player one wins diagnally
				)
				
			{
				this.addChild(_player); // adds the player text to the stage
				_player.text = "Player one wins!"; // tells the user that player one won
				_player.setTextFormat(_textstyle); // adds styel to the text
				this.addChild(_restart); // puts the restart button ont he stage
				_restart.addEventListener(MouseEvent.CLICK, resetAll); // makes the restart button clickable so tha the game can restart
			}else if(
				(_tile[0].currentFrame == 2 && _tile[1].currentFrame == 2 && _tile[2].currentFrame == 2) || // player two wins horizontally (row 1)
				
				(_tile[3].currentFrame == 2 && _tile[4].currentFrame == 2 && _tile[5].currentFrame == 2) || // player two wins horizontally (row 2)
				
				(_tile[6].currentFrame == 2 && _tile[7].currentFrame == 2 && _tile[8].currentFrame == 2) || // player two wins horizontally (row 3)
				
				(_tile[0].currentFrame == 2 && _tile[3].currentFrame == 2 && _tile[6].currentFrame == 2) || // player two wins vertically (column 1)
				
				(_tile[1].currentFrame == 2 && _tile[4].currentFrame == 2 && _tile[7].currentFrame == 2) ||// player two wins vertically (column 2)
				
				(_tile[2].currentFrame == 2 && _tile[5].currentFrame == 2 && _tile[8].currentFrame == 2) ||// player two wins vertically (column 3)
				
				(_tile[0].currentFrame == 2 && _tile[4].currentFrame == 2 && _tile[8].currentFrame == 2) || // player two wins diagnally
				
				(_tile[2].currentFrame == 2 && _tile[4].currentFrame == 2 && _tile[6].currentFrame == 2) // player two wins diagnally
			){
				this.addChild(_player);// adds the player text to the stage
				_player.text = "Player two wins!"; // tells the user that player two won
				_player.setTextFormat(_textstyle);// adds styel to the text
				this.addChild(_restart); // puts the restart button ont he stage
				_restart.addEventListener(MouseEvent.CLICK, resetAll);// makes the restart button clickable so tha the game can restart
			}
			
		}
		
		private function resetAll(event:MouseEvent):void // executes the fucntion to reset the whole game
		{
			this.removeChild(_restart); // removes the reset button for when the game begins
			_player.text = "Player one's turn"; // resets the text to anounce player one's turn (the default) 
			_player.setTextFormat(_textstyle); // adds format to the text
			for each(var t:Tile in _tile){ // goes through each tile in the array
				t.gotoAndStop(1); // resets the tiles int he array
				t.addEventListener(MouseEvent.CLICK, updateAll); // then makes it clickable so tha tht egame can be playable.
			}
//			_tile[0].gotoAndStop(1);
//			_tile[1].gotoAndStop(1);
//			_tile[2].gotoAndStop(1);
//			_tile[3].gotoAndStop(1);
//			_tile[4].gotoAndStop(1);
//			_tile[5].gotoAndStop(1);
//			_tile[6].gotoAndStop(1);
//			_tile[7].gotoAndStop(1);
//			_tile[8].gotoAndStop(1);
//			this.removeChild(_tile);
			
		}
		
	}
}