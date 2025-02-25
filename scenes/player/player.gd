extends CharacterBody2D

class_name Player

var run_speed = 450
var jump_speed = -1000
var long_jump_speed = -15
var gravity = 2500
var direction = 1
var is_crouching = false
var health = 100
var idle_timer = 0
var is_invincible = false

signal health_changed

@onready var idle_animation = $IdleAnimation
@onready var character_sprite = $CharacterSprite
@onready var crouching_sprite = $CrouchingSprite
@onready var character_sprite_hitbox = $CharacterSpriteHitbox
@onready var crouching_sprite_hitbox = $CrouchingSpriteHitbox

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	
	var jump = Input.is_action_just_pressed("up")
	var long_jump = Input.is_action_pressed("up")
	
	var crouch = Input.is_action_just_pressed("down")
	var uncrouch = Input.is_action_just_released("down")
	
	var test = Input.is_anything_pressed()
	
	if test:
		idle_timer = 0
	
	if is_on_floor() and jump:
		if not is_crouching:
			velocity.y = jump_speed
		else:
			velocity.y = jump_speed + 450
		
	if long_jump:
		velocity.y += long_jump_speed
	if right:
		if not is_crouching:
			velocity.x += run_speed
		else:
			velocity.x += run_speed - 200
	if left:
		if not is_crouching:
			velocity.x -= run_speed
		else:
			velocity.x -= run_speed - 200
	if crouch:
		character_sprite.hide()
		character_sprite_hitbox.disabled = true
		crouching_sprite_hitbox.disabled = false
		crouching_sprite.show()
		is_crouching = true
	if uncrouch:
		crouching_sprite.hide()
		crouching_sprite_hitbox.disabled = true
		character_sprite_hitbox.disabled = false
		character_sprite.show()
		is_crouching = false

func takeDamage(damage):
	if not is_invincible:
		is_invincible = true
		modulate = (Color(1,1,1,0.6))
		health -= damage
		health_changed.emit()
		var timer = Timer.new()
		add_child(timer)
		timer.start(2)
		timer.connect("timeout", removeInvincibility)
	
func removeInvincibility():
	is_invincible = false
	modulate = (Color(1,1,1,1))
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Idle timer control
	if (idle_timer < 2):
		idle_timer += delta
		if (idle_animation.is_playing()):
			idle_animation.stop()
			idle_animation.hide()
			character_sprite.show()
	else:
		if (not idle_animation.is_playing()):
			character_sprite.hide()
			idle_animation.show()
			idle_animation.play()

func _physics_process(delta):
	#Applies gravity
	velocity.y += gravity * delta
	
	#If velocity and direction are different, and the player is moving, it means they have changed direction
	if (sign(velocity.x) != sign(direction) and sign(velocity.x) != 0):
		apply_scale(Vector2(-1, 1))
		direction *= -1
	
	get_input()
	
	move_and_slide()
	 
	var collision = get_last_slide_collision()
	if collision:
		collision = collision.get_collider()
		if collision.is_in_group("DamagingObjects"):
			takeDamage(15)
	Globals.player_position = position

	#if (get_last_slide_collision() == ""):
		
