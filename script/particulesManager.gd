extends Node

func play(particules,pos):
	var p = particules.instantiate()
	p.global_position = pos
	p.emitting = true
	GM.main.add_child(p)
