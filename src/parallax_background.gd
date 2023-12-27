extends ParallaxBackground

var velocity = Vector2.ZERO # The background's movement vector.
var sprite_width = 288
var time = true;

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Some random multipliers for the motion scales to get a layered parallax effect
# Scroll_offset indicates how fast the base background moves (seems to need the manual adding)
func _process(delta):
	$BuildingsLayer.motion_scale = Vector2(1.5,0)
	$GrassLayer.motion_scale = Vector2(2,0)
	$BaseLayer.motion_scale = Vector2(6,0)
	scroll_offset += velocity

# Freeze the scrolling
func end_game():
	velocity = Vector2.ZERO
	
func start_game():
	velocity = Vector2(-0.1,0)

# Changes between the day/night background sprites
func toggle_time():
	time = not time
	if time:
		toggle_night()
	else:
		toggle_day()

func toggle_day():
	$SkyLayer/DaySkySprite.show()
	$BuildingsLayer/DayBuildingsSprite.show()
	$GrassLayer/DayGrassSprite.show()
	hide_night()
	
func toggle_night():
	$SkyLayer/NightSkySprite.show()
	$BuildingsLayer/NightBuildingsSprite.show()
	$GrassLayer/NightGrassSprite.show()
	hide_day()

func hide_day():
	$SkyLayer/DaySkySprite.hide()
	$BuildingsLayer/DayBuildingsSprite.hide()
	$GrassLayer/DayGrassSprite.hide()

func hide_night():
	$SkyLayer/NightSkySprite.hide()
	$BuildingsLayer/NightBuildingsSprite.hide()
	$GrassLayer/NightGrassSprite.hide()
