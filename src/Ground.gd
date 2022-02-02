extends Node2D

var base_cactus = preload("res://src/Small Cactus.tscn") #load small cactus
var base_large_cactus = preload("res://src/Large Cactus.tscn") #load big cactus
var base_triple_cactus = preload("res://src/Triple Cactus.tscn") #load big cactus
var base_double_cactus = preload("res://src/Double Cactus.tscn")
var new_enemy_time = 5 #elapsed time to load new enemy

var rng = RandomNumberGenerator.new() #random number generator

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if OS.get_name() == "HTML5":
		OS.set_window_maximized(true)
	else:
		GlobalAudioStreamPlayer.play_sound(GlobalAudioStreamPlayer.startup_sound)
	Global.load_score()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !Global.dead and Global.started and !Global.paused:
		if Global.elapsed_time != 0 and Global.elapsed_time >= new_enemy_time: #spawn new cactus every set amount of time
			if Global.elapsed_time >= 75:
				new_enemy_time += 1.5
			else:
				new_enemy_time += (4 - Global.elapsed_time/25)
			create_enemy()
	elif (Global.dead):
		if Input.is_action_just_pressed("ui_focus_next"):
			get_parent().add_child(load("res://src/Ground.tscn").instance())
			queue_free()
			Global.reload()
			
func random_num(minimum: int, maximum: int) -> int: #returns random number between range (inclusive)
	rng.randomize()
	return rng.randi_range(minimum, maximum)

func spawn_enemy(scene: PackedScene) -> void:
	var new_cactus = scene.instance() #instantiate new cactus and put it right outside the screen
	new_cactus.global_position = Vector2(1040, 560)
	if random_num(1, 2) == 1:
		new_cactus.set_scale(Vector2(-1,1)) #flip orientation of cactus
	add_child(new_cactus)

func create_enemy() -> void:
	var random_num = random_num(1, 4)
	if random_num == 1: #spawn large cactus
		spawn_enemy(base_large_cactus)
	elif random_num == 2: #spawn small cactus
		spawn_enemy(base_cactus)
	elif random_num == 3: #spawn triple cactus
		spawn_enemy(base_triple_cactus)
	else: #spawn double cactus
		spawn_enemy(base_double_cactus)
		
