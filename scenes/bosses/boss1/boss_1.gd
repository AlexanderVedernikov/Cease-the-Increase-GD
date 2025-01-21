extends CharacterBody2D


var rock = preload("res://scenes/levels/big_rock.tscn")
var rock_timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if (rock_timer < 5):
		rock_timer += delta
	else:
		var new_rock = rock.instantiate()
		add_child(new_rock)
		rock_timer = 0
	
	

