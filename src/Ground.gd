extends Node2D

var base_cactus = preload("res://src/Small Cactus.tscn") #load small cactus

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.dead and Global.started:
		var num_enemies = get_tree().get_nodes_in_group("ENEMIES").size() #get all enemies (nodes that are in the ENEMIES group)
		if Global.elapsed_time != 0 and Global.elapsed_time % 5 == 0 and num_enemies < 2:
			create_enemy()


func create_enemy() -> void:
	var new_cactus = base_cactus.instance() #instantiate new cactus and put it right outside the screen
	new_cactus.global_position = Vector2(1040, 560)
	add_child(new_cactus)
