extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	show()
	position = Vector2(0, -300)
	apply_impulse(Vector2(1.5 * (Globals.player_position.x - 1960), Globals.player_position.y - 450))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (position.y > 5000):
		hide()
		queue_free()
