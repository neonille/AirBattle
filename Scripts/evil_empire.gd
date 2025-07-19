extends Node

class_name EvilEmpire

const bomber = preload("res://Scenes/bomber1.tscn")
const leftSpawnX = -24
const rightSpawnX = 272


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var timer = $Timer as Timer
	timer.start(4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var bomber = bomber.instantiate() as Bomber1
	
	get_parent().add_child(bomber)
	pass # Replace with function body.

func decideSpawnPoint():
	
	pass
