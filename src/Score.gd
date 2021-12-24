extends RichTextLabel

func _ready() -> void: 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.started and Global.time_start == 0: #get time only once the game has started
		Global.time_start = OS.get_unix_time()
	if !Global.dead and Global.started:
		Global.current_time = OS.get_unix_time()
		Global.elapsed_time = (Global.current_time - Global.time_start) + 1 #get time since game started (plus one)
	self.text = "Score: " + str(Global.elapsed_time) #print score


