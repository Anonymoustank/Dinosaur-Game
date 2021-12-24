extends Node2D

var base_cactus = preload("res://src/Small Cactus.tscn") #load small cactus
var base_large_cactus = preload("res://src/Large Cactus.tscn") #load big cactus
var new_enemy_time = 5 #elapsed time to load new enemy

var rng = RandomNumberGenerator.new() #random number generator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.dead and Global.started:
		var num_enemies = get_tree().get_nodes_in_group("ENEMIES").size() #get all enemies (nodes that are in the ENEMIES group)
		if Global.elapsed_time != 0 and Global.elapsed_time >= new_enemy_time and num_enemies < 2:
			if Global.elapsed_time >= 75:
				new_enemy_time += 1.5
			else:
				new_enemy_time += (4 - Global.elapsed_time/25)
			create_enemy()

func random_num(minimum: int, maximum: int) -> int:
	rng.randomize()
	return rng.randi_range(minimum, maximum)

func spawn_enemy(scene: PackedScene) -> void:
	var new_cactus = scene.instance() #instantiate new cactus and put it right outside the screen
	new_cactus.global_position = Vector2(1040, 560)
	if random_num(1, 2) == 1:
		new_cactus.set_scale(Vector2(-1,1))
	add_child(new_cactus)

func create_enemy() -> void:
	var random_num = random_num(1, 2)
	if random_num == 1: #spawn large cactus
		spawn_enemy(base_large_cactus)
	elif random_num == 2: #spawn small cactus
		spawn_enemy(base_cactus)
		
