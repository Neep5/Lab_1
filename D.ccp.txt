void _CYCLIC ProgramCyclic(void)
{
	if(Enable)
	{
		counter++;
		if(counter < 200)
		{
			speed=0;
		}
		else if(counter < 400)
		{
			speed=50;
		}
		else
		{
			speed=0;
		}
		
		FB_controller.e=speed-fb_motor2.w;
		FB_Regulator(&FB_controller);
		fb_motor.u=speed-fb_motor.w;
		fb_motor2.u=FB_controller.u;
		FB_Motor(&fb_motor);
		FB_Motor(&fb_motor2);
	}
}