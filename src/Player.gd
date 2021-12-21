extends KinematicBody2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"
export var gravity = 800.0
var velocity = Vector2.ZERO
const FLOOR_NORMAL = Vector2.UP
onready var anim = $AnimationPlayer

func _physics_process(delta: float) -> void:
	if Global.started and !Global.dead:
		check_jump()
		run_animation()
		apply_gravity(delta)
	else:
		anim.stop()

func check_jump() -> void:
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y -= gravity * 0.75

func apply_gravity(delta: float) -> void:
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, FLOOR_NORMAL)

func run_animation() -> void:
	if is_on_floor():
		anim.play("Run")
	else:
		anim.play("Jump")
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	 pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
	
