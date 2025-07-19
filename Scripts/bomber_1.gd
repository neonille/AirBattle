extends Node2D

class_name Bomber1

enum HeadingDirections {
	LEFT = -1,
	RIGHT = 1
}

enum GoAroundSpots {
	LEFT = 8 * 3 * -1,
	RIGHT = 8 * 35
}

const halfTheScreen = 256/2

var speed = 100
var heading = 0
var targetGoAroundSpot = 0
var bomblevel = 0
var bombDropPos = 0
var hasBomb = true

func _ready() -> void:
	var xPos = position.x
	if xPos > 0:
		updateHeading(HeadingDirections.LEFT, false)
	else:
		updateHeading(HeadingDirections.RIGHT, true)
	setDropPos()

func _process(delta: float) -> void:
	var headingVector = Vector2(heading, 0)
	position += delta * speed * headingVector
	checkDropBomb()
	checkGoAround()
	
func setDropPos():
	var offset = (randi_range(1,5) * 20) + 20 # 40 - 120 with 20 interval
	bombDropPos = halfTheScreen + (offset * heading)
			
func updateHeading(target: HeadingDirections, shouldFlip: bool):
	if bomblevel == 3:
		queue_free()
	if target == HeadingDirections.LEFT:
		heading = HeadingDirections.LEFT
		targetGoAroundSpot = GoAroundSpots.LEFT
	else:
		heading = HeadingDirections.RIGHT
		targetGoAroundSpot = GoAroundSpots.RIGHT
	if shouldFlip:
		flip()

func flip():
	scale.x *= -1
	
func AdvanceBombLevel():
	if hasBomb == false: return
	var bomb = $Bomb as Bomb
	bomb.position.y += 1
	bomblevel += 1
	
func checkGoAround():
	if heading == HeadingDirections.RIGHT and position.x >= GoAroundSpots.RIGHT:
		updateHeading(HeadingDirections.LEFT, true)
		AdvanceBombLevel()
	if heading == HeadingDirections.LEFT and position.x <= GoAroundSpots.LEFT:
		updateHeading(HeadingDirections.RIGHT, true)
		AdvanceBombLevel()

func checkDropBomb():
	if hasBomb == false or bomblevel != 2: return
	if heading == HeadingDirections.LEFT:
		if position.x <= bombDropPos:
			dropBomb()
	if heading == HeadingDirections.RIGHT:
		if position.x >= bombDropPos:
			dropBomb()
			
func dropBomb():
	var bomb = $Bomb as Bomb
	bomb.release()
	hasBomb = false
	bomblevel += 1
			
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name != "Bullet": return
	
	if area.get_parent().is_in_group("BulletGroup"):
		queue_free()
