extends Sprite2D

class_name Bullet

var direction = Vector2.UP
@export var speed = 0

func _process(delta: float) -> void:
	position += delta * speed * direction
	if position.y < 1:
		queue_free()
