extends KinematicBody2D

var startPos = Vector2()
var endPos = Vector2()
var ballAttached = false
var canPickUpBall = false
var velocity = 0
var currentPos = self.position


func _ready():
	set_process_input(true)
	set_physics_process(true)

func _physics_process(delta):
	pass
#	if ballAttached and currentPos.distance_to(self.position) > 10:
#		self.position = self.position + (currentPos - self.position).normalized() * velocity * delta

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and canPickUpBall:
			startPos = event.position
			ballAttached = true

		if event.button_index == BUTTON_LEFT and event.pressed == false:
			endPos = event.position
			ballAttached = false
			velocity = 0

	if event is InputEventMouseMotion and ballAttached:
		self.position = event.position


func _on_Ball_mouse_entered():
	canPickUpBall = true

func _on_Ball_mouse_exited():
	canPickUpBall = false
	
