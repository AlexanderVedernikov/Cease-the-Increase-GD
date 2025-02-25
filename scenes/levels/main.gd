extends Node2D

@onready var pause_menu = $PauseCanvasLayer/PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
		
func pauseMenu():
	paused = not paused
	if paused:
		pause_menu.show()
		get_tree().paused = true
	else:
		pause_menu.hide()
		get_tree().paused = false
	


func _on_resume_pressed():
	pause_menu.hide()
	get_tree().paused = false


func _on_quit_pressed():
	get_tree().quit()
