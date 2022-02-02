extends Node

onready var jump_sound = preload("res://src/Audio/Jump.mp3")
onready var death_sound = preload("res://src/Audio/Game Over.mp3")
onready var startup_sound = preload("res://src/Audio/Startup.mp3")
onready var sound_player = $AudioStreamPlayer

func play_sound(stream: AudioStreamMP3) -> void: #plays audio
	sound_player.stream = stream
	sound_player.stream.set_loop(false) #make sure audio doesn't loop
	sound_player.play()
	
func _ready():
	pass


