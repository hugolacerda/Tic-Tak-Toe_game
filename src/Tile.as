package
{
	import flash.events.Event;

	public class Tile extends TileBase
	{
		public function Tile()
		{
			super();
			this.stop();
			
			
		}
		
		public function tileSetup():void
		{
			this.gotoAndStop(1);
		}
	}
}