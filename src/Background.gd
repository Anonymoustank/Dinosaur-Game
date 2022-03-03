extends Sprite

var speed = -3 - (Global.elapsed_time / 5.0)
var texture_width: float = 0

func _ready():
	texture_width = abs(texture.get_size().x * scale.x)
	
func _process(delta: float) -> void:
	if !Global.dead and Global.started and !Global.paused:
		position.x += speed
		_attempt_reposition()
	
func _attempt_reposition() -> void:
	if position.x <= -0.5 * texture_width:
		# Don't just reset position texture width, otherwise there will be a gap
		position.x += 2 * texture_width
