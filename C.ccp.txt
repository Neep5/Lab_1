void FB_Regulator(struct FB_Regulator* inst)
{
inst->integrator.in=((inst->e)*(inst->k_i)*(inst->dt))+inst->iyOld;
	FB_Integrator(&(inst->integrator));
	if (inst->e*inst->k_p>inst->max_abs_value)
	{
		if (inst->integrator.out +(inst->max_abs_value) > inst->max_abs_value)
		{
			inst->u=inst->max_abs_value;
		}
		else if (inst->integrator.out +(inst->max_abs_value) < -(inst->max_abs_value))
		{
			inst->u=-(inst->max_abs_value);
		}
		else
		{
			inst->u=inst->integrator.out + inst->max_abs_value;
		}
		inst->iyOld=inst->u -(inst->integrator.out + inst->max_abs_value);
	}
		
	else if (inst->e*inst->k_p < -(inst->max_abs_value))
	{
		if (inst->integrator.out -(inst->max_abs_value) > inst->max_abs_value)
		{
			inst->u=inst->max_abs_value;
		}
		else if (inst->integrator.out -(inst->max_abs_value) < -(inst->max_abs_value))
		{
			inst->u= -(inst->max_abs_value);
		}
		else
		{
			inst->u=inst->integrator.out -(inst->max_abs_value);
		}
		inst->iyOld=inst->u - (inst->integrator.out -(inst->max_abs_value));
	}
		
	else
	{
		if (inst->integrator.out + inst->e*inst->k_p > inst->max_abs_value)
		{
			inst->u=inst->max_abs_value;
		}
		else if (inst->integrator.out + inst->e*inst->k_p < -(inst->max_abs_value))
		{
			inst->u=-(inst->max_abs_value);
		}
		else
		{
			inst->u=inst->integrator.out + inst->e*inst->k_p;
		}
		inst->iyOld=inst->u - (inst->integrator.out + inst->e*inst->k_p;
	}
}