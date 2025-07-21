extends Node

class_name EvilEmpire

const bomber = preload("res://Scenes/bomber1.tscn")
const leftSpawnX = -24
const rightSpawnX = 272
var lanes = [null,null,null,null,null,null]
@onready var timer = $Timer as Timer


func _ready() -> void:
	timer.start()

func _process(delta: float) -> void:
	pass

func _on_timer_timeout() -> void:
	timer.start()
	var selectedLane = decideSpawnLane()
	if selectedLane == null: return
	spawn(selectedLane)

func decideSpawnLane():
	var emptyLanesIndexes = []
	for i in lanes.size():
		if lanes[i] == null:
			emptyLanesIndexes.push_back(i)
	if emptyLanesIndexes.is_empty():
		return null
	var randIndex = randi_range(0, emptyLanesIndexes.size() -1)
	return emptyLanesIndexes[randIndex]

func spawn(lane):
	var bomber = bomber.instantiate() as Bomber1
	get_parent().add_child(bomber)
	lanes[lane] = bomber.name
	bomber.position = Vector2(leftSpawnX, (lane+1) * 16)

func clearLane(name):
	for i in lanes.size():
		if lanes[i] == name:
			lanes[i] = null
