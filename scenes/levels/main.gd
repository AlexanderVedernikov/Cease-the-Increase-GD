extends Node2D

@onready var pause_menu = $PauseCanvasLayer/PauseMenu


@export var dialogue_json: JSON
@onready var state = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	($EzDialogue as EzDialogue).start_dialogue(dialogue_json, state)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		
		
func pauseMenu():
	Globals.paused = not Globals.paused
	if Globals.paused:
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


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	$DialogueLayer/DialogueBox.clear_dialogue_box()
	
	$DialogueLayer/DialogueBox.add_text(response.text)
	
	for choice in response.choices:
		$DialogueLayer/DialogueBox.add_choice(choice)
