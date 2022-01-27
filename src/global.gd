extends Node

var dead = false
var elapsed_time = 0 #time spent playing (not paused)
var current_time = 0 #used to calculate elapsed time
var started = false
var gravity = 800.0
var paused = false
var pause_time = 0 #time game spent paused
const FLOOR_NORMAL = Vector2.UP
onready var sound_player = get_tree().get_root().get_node("Ground/Player/AudioStreamPlayer")
onready var jump_sound = preload("res://src/Audio/Jump.mp3")
onready var death_sound = preload("res://src/Audio/Game Over.mp3")
onready var startup_sound = preload("res://src/Audio/Startup.mp3")

func play_sound(stream: AudioStreamMP3) -> void: #plays audio
	sound_player.stream = stream
	sound_player.stream.set_loop(false) #make sure audio doesn't loop
	sound_player.play()

func die() -> void:
	dead = true
	play_sound(death_sound)
	
