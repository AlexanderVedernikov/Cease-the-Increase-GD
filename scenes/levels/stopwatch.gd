extends Label

var time = 0
var seconds = 0
var minutes = 0
var hours = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	time = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hours > 9:
		text = str(hours)
	else:
		text = "00"
	text += ":"
	if minutes > 9:
		text += str(minutes)
	else:
		text += "0" + str(minutes)
	text += ":"
	if seconds > 9:
		text += str(seconds)
	else:
		text += "0" + str(seconds)

	_updateStopwatch(delta)

func _updateStopwatch(delta):
	if not Globals.paused:
		time += delta
		seconds = int(time) % 60
		minutes = (int(time) / 60)
		hours = (int(time) / 3600)


func _on_stopwatch_pressed():
	if visible:
		hide()
	else:
		show()
