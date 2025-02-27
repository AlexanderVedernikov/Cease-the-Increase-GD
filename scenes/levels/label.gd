extends Label


# Called when the node enters the scene tree for the first time.
var fps = 0
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	fps = int(1 / delta)
	text = str(fps)


func _on_fps_counter_pressed():
	if visible:
		hide()
	else:
		show()
