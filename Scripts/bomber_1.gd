extends Node2D

enum HeadingDirections {
	LEFT = -1,
	RIGHT = 1
}

enum GoAroundSpots {
	LEFT = 8 * 3 * -1,
	RIGHT = 8 * 35
}

@export var speed = 100
var heading = 0
var targetGoAroundSpot = 0
var bomblevel = 0

func _ready() -> void:	
	var xPos = position.x
	if xPos > 0:
		updateHeading(HeadingDirections.LEFT, false)
	else:
		updateHeading(HeadingDirections.RIGHT, true)

func _process(delta: float) -> void:
	var headingVector = Vector2(heading, 0)
	position += delta * speed * headingVector
	checkGoAround()
	
	
func updateHeading(target: HeadingDirections, shouldFlip: bool):
	if target == HeadingDirections.LEFT:
		heading = HeadingDirections.LEFT
		targetGoAroundSpot = GoAroundSpots.LEFT
	else:
		heading = HeadingDirections.RIGHT
		targetGoAroundSpot = GoAroundSpots.RIGHT
	if shouldFlip:
		flip()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("BulletGroup"):
		queue_free()

func flip():
	scale.x *= -1

func checkGoAround():
	if heading == HeadingDirections.RIGHT and position.x >= GoAroundSpots.RIGHT:
		updateHeading(HeadingDirections.LEFT, true)
		AdvanceBombLevel()
	if heading == HeadingDirections.LEFT and position.x <= GoAroundSpots.LEFT:
		updateHeading(HeadingDirections.RIGHT, true)
		AdvanceBombLevel()

func AdvanceBombLevel():
	var bomb = $Bomb as Bomb
	bomb.position.y += 1
	bomblevel += 1
