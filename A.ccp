void FB_Integrator(struct FB_Integrator* inst)
{
	inst->out=inst->out+inst->in*(inst->dt);
}