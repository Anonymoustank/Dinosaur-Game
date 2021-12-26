extends KinematicBody2D

var velocity = Vector2.ZERO
onready var anim = $AnimationPlayer
const position_x = 0 #starting x position for player

func _physics_process(delta: float) -> void:
	if Global.started and !Global.dead:
		check_jump()
		run_animation()
		apply_gravity(delta)
		if self.global_position.x != position_x: #made to filter for when collisions aren't detected, but players are displaced by enemiy collisions
			Global.die()
	else:
		anim.stop() #stop all animations and make sure screen is frozen once death happens

func check_jump() -> void:
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y -= Global.gravity * 0.75 #change velocity if player wants to jump and is on floor
		Global.play_sound(Global.jump_sound)

func apply_gravity(delta: float) -> void:
	velocity.y += Global.gravity * delta #make sure gravity is applied to the player
	velocity = move_and_slide(velocity, Global.FLOOR_NORMAL)

func run_animation() -> void:
	if is_on_floor(): #run different player animations depending on whether or not you are jumping
		anim.play("Run")
	else:
		anim.play("Jump")
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	 pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
	
