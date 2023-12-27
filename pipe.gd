extends RigidBody2D

var player_position
var point = false
var score_hud

enum color {GREEN, RED}
var current_color = color.GREEN

func _integrate_forces(state):
	var velocity = Vector2.ZERO
	velocity.x = -250
	state.set_linear_velocity(velocity)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _physics_process(delta):
	if not point:
		if position.x < player_position.x:
			point = true
			score_hud.update_score()

func set_score_pos(pos):
	player_position = pos

func set_color(index):
	match (index):
		0:
			$AnimatedSprite2D.animation = &"green"
		1:
			$AnimatedSprite2D.animation = &"red"
		_:
			$AnimatedSprite2D.animation = &"green"

func score(hud):
	score_hud = hud

func remove_pipe():
	queue_free()
