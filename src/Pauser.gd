extends Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false # Replace with function body.

func _input(event) -> void:
	if !Global.dead and Global.started:
		if event.is_action_pressed("ui_cancel"):
			Global.paused = !Global.paused
			get_tree().paused = !get_tree().paused
			self.visible = !self.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.paused:
		Global.pause_time += delta
		Global.current_time += delta
