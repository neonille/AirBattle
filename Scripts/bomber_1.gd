extends Node2D

const headingLeft = -1
const headingRight = 1

@export var speed = 100
var heading = 0
var targetGoAround = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bomb = get_node("BombSprite") as Sprite2D
	bomb.position.y += 2
	
	var xPos = position.x
	if xPos > 0:
		heading = headingLeft
	else:
		heading = headingRight
		scale.x *= -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var headingVector = Vector2(heading, 0)
	position += delta * speed * headingVector

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("BulletGroup"):
		queue_free()
