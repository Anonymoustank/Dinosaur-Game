extends Node

var dead = false
var elapsed_time = 0 #time spent playing (not paused)
var current_time = 0 #used to calculate elapsed time
var started = false
var gravity = 800.0
var paused = false
var pause_time = 0 #time game spent paused
const FLOOR_NORMAL = Vector2.UP
var score_file = "user://new_score.save" #saves highscores
var highscore = 0
var times_played_again = 0 #how many times you've played the game
var cactus_escaped = 0 #total amount of cacti you've gotten past (only counts if they've left the screen)
var save_file_data = {"highscore": 0, "times_played_again": 0, "cactus_escaped": 0}

func load_score(): #run when starting, loads high score, times played, and cactus escaped
	var file = File.new()
	if file.file_exists(score_file):
		file.open(score_file, File.READ)
		save_file_data = parse_json(file.get_as_text()) #parse the JSON and make it a dictionary
		#highscore = file.get_var()
		highscore = save_file_data["highscore"]
		times_played_again = save_file_data["times_played_again"]
		cactus_escaped = save_file_data["cactus_escaped"]
		file.close()
	else:
		highscore = 0 #set values if no save file found
		times_played_again = 0
		cactus_escaped = 0

func reload(): #reset variables on reload
	dead = false
	paused = false
	started = false
	elapsed_time = 0
	current_time = 0
	pause_time = 0

func save_data():
	save_file_data["highscore"] = highscore #save all of the new data into the save_file_data dictionary
	times_played_again = times_played_again + 1
	save_file_data["times_played_again"] = times_played_again
	save_file_data["cactus_escaped"] = cactus_escaped
	var file = File.new()
	file.open(score_file, File.WRITE)
	#file.store_var(save_file_data)
	file.store_line(to_json(save_file_data)) #save the dictionary as json file
	file.close()

func die() -> void:
	dead = true
	if (int(elapsed_time) > highscore):
		highscore = int(elapsed_time) #save new highscore
	save_data()
	GlobalAudioStreamPlayer.play_sound(GlobalAudioStreamPlayer.death_sound)
	
