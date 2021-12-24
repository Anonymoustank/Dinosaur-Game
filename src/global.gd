extends Node

var dead = false
var time_start = 0 #used along with current_time to calculate elapsed time
var elapsed_time = 0 #time since game started
var current_time = 0 #used along with time_start to calculate elapsed time
var started = false
var gravity = 800.0
const FLOOR_NORMAL = Vector2.UP
