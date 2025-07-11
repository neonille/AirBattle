extends Sprite2D

class_name Bomb

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func release():
	var pos = global_position
	var root = get_tree().get_current_scene()
	get_parent().remove_child(self)
	root.add_child(self)
	position = pos
