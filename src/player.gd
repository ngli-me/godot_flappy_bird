extends Area2D

var screen_size # Size of the game window
@export var jump_speed = 500 # How fast the player will move (pixels/sec).
@export var falling_speed = 1000
@export var max_speed = 2000
var velocity
var alive_state = false
var jumping = false

enum color {BLUE, RED, YELLOW}
var current_color = color.BLUE

signal hit

func _ready():
	hide()
	velocity = Vector2.ZERO
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.animation = &"blue"

func _process(delta):
	if not alive_state:
		return
	if jumping:
		jumping = false
		if velocity.y > 0:
			velocity.y = 0
		velocity.y -= jump_speed
		velocity.y = max(velocity.y, -max_speed)
	# Whoa acceleration
	velocity.y += falling_speed * delta
	position += velocity * delta 
	# Make sure flappy bird stays in bounds
	position = position.clamp(Vector2.ZERO, screen_size)
	# Animation
	$AnimatedSprite2D.play()
	# Rotate the bird
	rotation = atan2(velocity.y, 1000)

func _input(event):
	if event.is_action_pressed("jump"):
		if alive_state:
			jumping = true

func _on_body_entered(body):
	alive_state = false
	hide() # Player disappears after being hit.
	hit.emit()
	# Defer since can't change physics properties on a physics callback
	$CollisionShape2D.set_deferred(&"disabled", true)

func start(pos):
	velocity = Vector2.ZERO
	position = pos
	show()
	$CollisionShape2D.disabled = false
	await get_tree().create_timer(0.5).timeout
	alive_state = true

func change_color(index):
	match (index):
		0:
			$AnimatedSprite2D.animation = &"blue"
		1:
			$AnimatedSprite2D.animation = &"red"
		2:
			$AnimatedSprite2D.animation = &"yellow"
		_:
			$AnimatedSprite2D.animation = &"blue"
