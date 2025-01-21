extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	
	play()
	show()
	position = Vector2(randi_range(50, 3590), randi_range(50, 870))
	await get_tree().create_timer(1.4).timeout
	hide()
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

