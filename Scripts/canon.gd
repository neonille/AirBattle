extends Sprite2D

var bullet = preload("res://Scenes/Bullet.tscn")
var directions = [-0.9, 0, 0.9]
var rotations = [-37, 0, 37]
var currentDir = 1


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_right"):
		currentDir += 1
		if currentDir == 3:
			currentDir = 2
	if Input.is_action_just_pressed("ui_left"):
		currentDir -= 1
		if currentDir == -1:
			currentDir = 0
	if Input.is_action_just_pressed("ui_accept"):
		var bull = bullet.instantiate() as Bullet
		get_parent().add_child(bull)
		bull.position = position
		bull.direction = Vector2(directions[currentDir],-1)
	rotation_degrees =  rotations[currentDir]
		
