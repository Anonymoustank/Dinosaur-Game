extends KinematicBody2D
class_name Enemy

# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
var velocity = Vector2.ZERO
var speed = -2.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	if !Global.dead and Global.started:
		velocity.x = speed
		var collision = move_and_collide(velocity)
		if collision and collision.collider.name == "Player":
			Global.dead = true
		#velocity = move_and_slide(velocity, Global.FLOOR_NORMAL)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
