package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class pacman extends MovieClip
	{
 private var directed:int = 3;// left
 private var directed1:int = 3;// first directed
 public var stoped:Boolean = true;
	private	const speed = 4;
 public var array_wall:Array = new Array();

		// к сожалению инициирую вручну :( 

		public function pacman()
		{
			//addEventListener(Event.ENTER_FRAME, movePac);
			array_wall[0] = [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3];
			array_wall[1] = [3,0,1,1,1,1,1,1,1,2,0,1,1,1,1,1,1,1,2];
			array_wall[2] = [3,0,0,1,1,1,1,0,2,2,2,0,0,1,1,1,1,0,2];
			array_wall[3] = [3,2,2,0,1,1,1,3,2,2,2,2,1,1,1,1,2,2,2];
			array_wall[4] = [3,2,2,1,1,1,1,1,2,0,2,0,1,1,1,1,3,2,2];
			array_wall[5] = [3,1,1,0,1,1,1,1,1,2,0,1,1,1,1,1,0,1,3];
			array_wall[6] = [3,0,0,2,0,1,1,0,0,2,0,0,0,1,1,2,0,0,2];
			array_wall[7] = [3,2,2,2,2,0,2,2,1,0,0,3,2,0,2,2,2,2,2];
			array_wall[8] = [3,2,2,2,2,2,2,2,0,0,0,2,2,2,2,2,2,2,2];
			array_wall[9] = [3,2,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,2,2];
			array_wall[10] = [3,2,2,2,2,2,2,2,1,1,1,3,2,2,2,2,2,2,2];
			array_wall[11] = [3,0,2,2,2,1,3,2,0,0,0,2,2,1,3,2,2,2,2];
			array_wall[12] = [3,1,1,2,1,1,1,1,1,2,0,1,1,1,1,3,0,1,3];
			array_wall[13] = [3,0,0,1,1,1,1,1,0,2,0,0,1,1,1,1,1,0,2];
			array_wall[14] = [3,2,2,0,1,1,1,1,2,0,2,0,1,1,1,1,2,2,2];
			array_wall[15] = [3,2,2,1,1,1,1,2,2,2,2,2,0,1,1,1,3,2,2];
			array_wall[16] = [3,0,1,1,1,1,1,1,3,2,2,1,1,1,1,1,1,1,2];
			array_wall[17] = [3,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,3];
			

		}


		public function rotatePac(event:KeyboardEvent)
		{
			switch (event.keyCode)
			{
				case Keyboard.UP :
					{
						directed1 = 2;
						stoped = true;
						break;

					};

				case Keyboard.RIGHT :
					{
						directed1 = 3;
						stoped = true;
						break;

					};
				case Keyboard.DOWN :
					{
						directed1 = 4;
						stoped = true;
						break;

					};
				case Keyboard.LEFT :
					{
						directed1 = 1;
						stoped = true;
						break;

				}
			}

		};

		public function movePac()
		{
			if ((this.x - 10) % 20 == 0 && (this.y - 10) % 20 == 0)
			{
				if (check_wall(directed1) == false)
				{
					directed = directed1;
				}
				if (check_wall(directed) == true){
					stoped = false;
				}
			}

			if (directed == 1 && stoped != false)
			{
				this.x -=  speed;
				this.rotation = 180;
			}
			if (directed == 2 && stoped != false)
			{
				this.y -=  speed;
				this.rotation = 270;
			}
			if (directed == 3 && stoped != false)
			{
				this.x +=  speed;
				this.rotation = 0;
			}
			if (directed == 4 && stoped != false)
			{
				this.y +=  speed;
				this.rotation = 90;
			}


		}// end rotatePac

		public function check_wall(dir:int):Boolean
		{
			switch (dir)
			{
				case 1 :
					{
						if (array_wall[((this.y - 10) / 20)][((this.x - 10) / 20)-1] >= 2)
						{
							return true;
						}
						break;

					};

				case 2 :
					{
						if (array_wall[((this.y - 10) / 20)-1][((this.x - 10) / 20)] == 1 || array_wall[((this.y - 10) / 20)-1][((this.x - 10) / 20)] == 3)
						{
							return true;
						}
						break;

					};

				case 3 :
					{
						if (array_wall[((this.y - 10) / 20)][((this.x - 10) / 20)] >= 2)
						{
							return true;
						}
						break;

					};

				case 4 :
					{
						if (array_wall[((this.y - 10) / 20)][((this.x - 10) / 20)] == 1 || array_wall[((this.y - 10) / 20)][((this.x - 10) / 20)] == 3)
						{
							return true;
						}
						break;

				}

			};

			return false;



		}// end check_wall

		



	}

}