extends Sprite2D

class_name Bullet

var direction = Vector2.UP
@export var speed = 0

func _process(delta: float) -> void:
	position += delta * speed * direction
	if position.y < 1:
		queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Airplane"):
		queue_free()
