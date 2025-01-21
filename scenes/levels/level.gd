extends Node2D

var background_effect = preload("res://scenes/levels/level_1_background_effects.tscn")
var effect_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (effect_timer < 0.333):
		effect_timer += delta
	else:
		var new_effect = background_effect.instantiate()
		add_child(new_effect)
		effect_timer = 0
	
	

