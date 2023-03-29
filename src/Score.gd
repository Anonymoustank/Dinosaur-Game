extends RichTextLabel

func _ready() -> void: 
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.dead and Global.started:
		Global.current_time += delta
		Global.elapsed_time = int(Global.current_time - Global.pause_time) + 1 #get time since game started (plus one), while subtracting time spent paused
	self.text = "Score: " + str(Global.elapsed_time) + "\nHighscore: " + str(Global.highscore) + "\nTimes Played: " + str(Global.times_played_again) + "\nTotal Cacti Escaped: " + str(Global.cactus_escaped) #print score and times played and cactus escaped
