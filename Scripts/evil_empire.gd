extends Node

class_name EvilEmpire

const bomber = preload("res://Scenes/bomber1.tscn")
const leftSpawnX = -24
const rightSpawnX = 272
const lanes = [null,null,null,null,null,null]

func _ready() -> void:
	var timer = $Timer as Timer
	timer.start(4)

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	var bomber = bomber.instantiate() as Bomber1
	get_parent().add_child(bomber)

func decideSpawnLane():
	var noLanesAvailable = lanes.all(func(lane): return lane != null)
	if noLanesAvailable: return
	
