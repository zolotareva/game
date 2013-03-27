package  {
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import flash.geom.ColorTransform;
		
	public class enemy extends pacman {
		
		var directed_ene:int = 3;
		var directed1_ene:int = 3;
		var speed_ene:int = 4;
		private var eneColor:uint;
		private var array_wall_ene:Array = new Array();
		public var stoped_ene:Boolean = true;

	
		public function enemy() {
			addEventListener(Event.ENTER_FRAME, moveEne);
			array_wall_ene[0] = [3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3];
			array_wall_ene[1] = [3,0,1,1,1,1,1,1,1,2,0,1,1,1,1,1,1,1,2];
			array_wall_ene[2] = [3,0,0,1,1,1,1,0,2,2,2,0,0,1,1,1,1,0,2];
			array_wall_ene[3] = [3,2,2,0,1,1,1,3,2,2,2,2,1,1,1,1,2,2,2];
			array_wall_ene[4] = [3,2,2,1,1,1,1,1,2,0,2,0,1,1,1,1,3,2,2];
			array_wall_ene[5] = [3,1,1,0,1,1,1,1,1,2,0,1,1,1,1,1,0,1,3];
			array_wall_ene[6] = [3,0,0,2,0,1,1,0,0,2,0,0,0,1,1,2,0,0,2];
			array_wall_ene[7] = [3,2,2,2,2,0,2,2,1,0,0,3,2,0,2,2,2,2,2];
			array_wall_ene[8] = [3,2,2,2,2,2,2,2,0,0,0,2,2,2,2,2,2,2,2];
			array_wall_ene[9] = [3,2,0,0,0,0,0,2,0,0,0,2,0,0,0,0,0,2,2];
			array_wall_ene[10] = [3,2,2,2,2,2,2,2,1,1,1,3,2,2,2,2,2,2,2];
			array_wall_ene[11] = [3,0,2,2,2,1,3,2,0,0,0,2,2,1,3,2,2,2,2];
			array_wall_ene[12] = [3,1,1,2,1,1,1,1,1,2,0,1,1,1,1,3,0,1,3];
			array_wall_ene[13] = [3,0,0,1,1,1,1,1,0,2,0,0,1,1,1,1,1,0,2];
			array_wall_ene[14] = [3,2,2,0,1,1,1,1,2,0,2,0,1,1,1,1,2,2,2];
			array_wall_ene[15] = [3,2,2,1,1,1,1,2,2,2,2,2,0,1,1,1,3,2,2];
			array_wall_ene[16] = [3,0,1,1,1,1,1,1,3,2,2,1,1,1,1,1,1,1,2];
			array_wall_ene[17] = [3,1,1,1,1,1,1,1,1,3,1,1,1,1,1,1,1,1,3];
			
 this.ene_body.eneColor = Math.random() * 0xffffff;
 var colorInfo:ColorTransform = this.ene_body.transform.colorTransform;
 colorInfo.color = this.ene_body.eneColor;
 this.ene_body.transform.colorTransform = colorInfo;	

		}
		
		public function moveEne(event:Event){
			
			if ((this.x - 10) % 20 == 0 && (this.y - 10) % 20 == 0)
			{
				directed1_ene = ran_directed();
				
				if (check_wall_ene(directed1_ene) == false)
				{					
					directed_ene = directed1_ene;
					
				}
				if (check_wall_ene(directed_ene) == true){					
					stoped_ene = false;	
					
				}
				
			}

			if (directed_ene == 1 && stoped_ene != false)
			{
				this.x -=  speed_ene;
				this.eys.x = -2;
				this.eys.y = -3;
			}
			if (directed_ene == 2 && stoped_ene != false)
			{
				this.y -=  speed_ene;
				this.eys.y = -5;
				this.eys.x = 0;
				
			}
			if (directed_ene == 3 && stoped_ene != false)
			{
				this.x +=  speed_ene;
				this.eys.x = +2;
				this.eys.y = -3;
				
			}
			if (directed_ene == 4 && stoped_ene != false)
			{
				this.y +=  speed_ene;
				this.eys.y = -1;
				this.eys.x = 0;
				
			}
			

		} // end moveEne()
		
		function ran_directed():int{
			var m:Number = Math.round(Math.random()*10);
			
			if(m == 10){
				m = 3;
			}
			if(m == 0){
				m = 1;
			}
			if(m == 5){
				m = 1;
			}
			if(m == 6){
				m = 2;
			}
			if(m == 7){
				m = 3;
			}
			if(m == 8){
				m = 4;
			}
			if(m == 9){
				m = 2;
			}
			stoped_ene = true;
			return m;
			
			
		}
		private function check_wall_ene(dir_ene:int):Boolean
		{
			switch (dir_ene)
			{
				case 1 :
					{
						if (array_wall_ene[((this.y - 10) / 20)][((this.x - 10) / 20)-1] >= 2)
						{
							return true;
						}
						break;

					};

				case 2 :
					{
						if (array_wall_ene[((this.y - 10) / 20)-1][((this.x - 10) / 20)] == 1 || array_wall_ene[((this.y - 10) / 20)-1][((this.x - 10) / 20)] == 3)
						{
							return true;
						}
						break;

					};

				case 3 :
					{
						if (array_wall_ene[((this.y - 10) / 20)][((this.x - 10) / 20)] >= 2)
						{
							return true;
						}
						break;

					};

				case 4 :
					{
						if (array_wall_ene[((this.y - 10) / 20)][((this.x - 10) / 20)] == 1 || array_wall_ene[((this.y - 10) / 20)][((this.x - 10) / 20)] == 3)
						{
							return true;
						}
						break;

				}

			};

			return false;



		}// end check_wall
		

	} // end class enemy	
} // end packege
