extends KinematicBody2D
class_name Enemy

var velocity = Vector2.ZERO
var speed = -3 - (Global.elapsed_time / 5.0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("ENEMIES") #add all enemies to the group "ENEMIES" so they can be tracked easily later
	
func _physics_process(delta: float) -> void:
	if !Global.dead and Global.started and !Global.paused:
		velocity.x = speed #ensures constant velocity to the left
		var collision = move_and_collide(velocity) #move and check for collisions
		if collision and collision.collider.name == "Player": #if a collision happens (and it's with the player, not the tilemap), the player dies
			Global.die()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	speed = -3 - (Global.elapsed_time / 5.0)
	if self.global_position.x < -250: #delete enemy at this position (once it's entirely out of frame)
		Global.cactus_escaped = Global.cactus_escaped + 1
		queue_free()
