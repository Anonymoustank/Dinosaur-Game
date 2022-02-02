extends Node

var dead = false
var elapsed_time = 0 #time spent playing (not paused)
var current_time = 0 #used to calculate elapsed time
var started = false
var gravity = 800.0
var paused = false
var pause_time = 0 #time game spent paused
const FLOOR_NORMAL = Vector2.UP
var score_file = "user://score.save" #saves highscores
var highscore = 0

func load_score(): #run when starting, loads high score
	var file = File.new()
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		highscore = file.get_var()
		file.close()
	else:
		highscore = 0

func reload():
	dead = false
	paused = false
	started = false
	elapsed_time = 0
	current_time = 0

func save_score():
	var file = File.new()
	file.open(score_file, File.WRITE)
	file.store_var(highscore)
	file.close()

func die() -> void:
	dead = true
	if (int(elapsed_time) > highscore):
		highscore = int(elapsed_time)
		save_score()
	GlobalAudioStreamPlayer.play_sound(GlobalAudioStreamPlayer.death_sound)
	
