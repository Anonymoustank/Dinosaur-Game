extends RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"): #start game once Space/Enter key is pressed
		Global.started = true
	if !Global.started: #if game hasn't started, show starting screen
		self.visible = true
	else:
		self.visible = false
