extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.dead: #if the player is dead, the death screen shows
		self.visible = true
	else:
		self.visible = false #if not, it doesn't show
