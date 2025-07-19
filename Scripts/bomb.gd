extends Area2D

class_name Bomb

var released = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if released:
		position.y += 0.5

func release():
	var root = get_tree().current_scene
	var globTrans = global_transform
	get_parent().remove_child(self)
	root.add_child(self)
	global_transform = globTrans
	released = true
