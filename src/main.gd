extends Node

@export var pipe_scene: PackedScene

var score
var pipe_queue = []
var pipe_offsets = []
var pipe_color = 0

func _on_hud_start_game():
	get_tree().call_group(&"pipe", &"queue_free")
	score = 0
	$Player.start($StartPosition.position)
	$ParallaxBackground.start_game()
	$StartTimer.start()
	$HUD.initialize_score()
	initialize_pipe_offset()
	
func _on_player_hit():
	$PipeTimer.stop()
	$ParallaxBackground.end_game()
	for pipe in pipe_queue:
		pipe.remove_pipe()
	pipe_queue = []
	$HUD.show_game_over()

func _on_start_timer_timeout():
	$PipeTimer.start()

func _on_pipe_timer_timeout():
	var tmp_offset = pipe_offsets[randi_range(0, 2)]
	spawn_pipe(get_node(^"PipeSpawn/PipeBottom").position, 0, tmp_offset[0])
	spawn_pipe(get_node(^"PipeSpawn/PipeTop").position, PI, tmp_offset[1])

func _on_hud_bird_color_change(index):
	$Player.change_color(index)

func _on_hud_pipe_color_change(index):
	pipe_color = index

func _on_hud_time_change():
	$ParallaxBackground.toggle_time()

func _ready():
	pass 
	
func initialize_pipe_offset():
	pipe_offsets.append([-100, -100]) # Top
	pipe_offsets.append([0, 0]) # Middle
	pipe_offsets.append([100, 100]) # Bottom
	
func spawn_pipe(position, direction, offset):
	var pipe = pipe_scene.instantiate()
	pipe.set_color(pipe_color)
	pipe.set_score_pos($StartPosition.position)
	pipe.score($HUD)
	
	pipe.position = position
	pipe.position.y += offset
	pipe.rotation = direction
	
	pipe_queue.append(pipe)
	add_child(pipe)
