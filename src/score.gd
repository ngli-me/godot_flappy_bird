extends Node2D

var current_value
var nums

func setup():
	current_value = 0
	# Instantiate a list of all of the sprites
	nums = [$V0, $V1, $V2, $V3, $V4, $V5, $V6, $V7, $V8, $V9]
	nums[current_value].show()

# Value should be single digit
func update_value(value):
	nums[current_value].hide()
	current_value = value
	nums[current_value].show()
