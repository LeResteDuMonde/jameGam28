extends Node

var web = true

func play(particules,pos):
	if GM.web: return
	var p = particules.instantiate()
	p.global_position = pos
	p.emitting = true
	GM.main.add_child(p)
	
	await get_tree().create_timer(p.lifetime).timeout
	if(p != null): p.queue_free()
	
