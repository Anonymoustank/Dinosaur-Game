extends RichTextLabel


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.started and Global.time_start == 0:
		Global.time_start = OS.get_unix_time()
	if !Global.dead and Global.started:
		Global.current_time = OS.get_unix_time()
		Global.elapsed_time = Global.current_time - Global.time_start
	self.text = "Score: " + str(Global.elapsed_time)
	if Global.elapsed_time >= 4:
		Global.dead = true


