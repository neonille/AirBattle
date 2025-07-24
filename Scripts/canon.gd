extends Sprite2D

var bullet = preload("res://Scenes/Bullet.tscn")
var directions = [-0.9, 0, 0.9]
var rotations = [-37, 0, 37]
var currentDir = 1
var sound1: AudioPlayer
var sound2: AudioPlayer

func _ready() -> void:
	sound1 = get_node("../Sound1") as AudioPlayer
	sound2 = get_node("../Sound2") as AudioPlayer

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("right"):
		rotateCanon(+1)
	if Input.is_action_just_pressed("left"):
		rotateCanon(-1)
	if Input.is_action_just_pressed("down"):
		shoot()
		
func rotateCanon(dir):
	if currentDir == 0 and dir == -1:
		return
	if currentDir == 2 and dir == +1:
		return
	currentDir += dir
	rotation_degrees =  rotations[currentDir]
	sound1.Play("canonmove")
	
func shoot():
	if checkIfCanShoot() == true:
		var bulletInstance = bullet.instantiate() as Bullet
		get_parent().add_child(bulletInstance)
		bulletInstance.position = position
		bulletInstance.position.y -= 1.7
		bulletInstance.direction = Vector2(directions[currentDir],-1)
		sound2.Play("Shoot1")
	
func checkIfCanShoot():
	var bullets = get_tree().get_nodes_in_group("Bullet")
	return bullets.size() < 2
