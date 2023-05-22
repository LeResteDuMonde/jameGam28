extends Label

var timer = 0
# Called when the node enters the scene tree for the first time.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !GM.gameOver:
		timer += delta
		updateLabel(timer)

func updateLabel(t):
	var hours = int(t / 3600)
	var minutes = int(t / 60) % 60
	var seconds = int(t) % 60
	
	var text = ""
	if hours > 0:
		text += str(hours) + ":"
	
	text += str(minutes).pad_zeros(2) + ":" + str(seconds).pad_zeros(2)
	
	self.text = text
