extends KinematicBody2D

var speed = 450
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(pos, dir):
	rotation = dir
	position = pos
	velocity = Vector2(speed, 0).rotated(rotation)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		$CollisionShape2D/AnimatedSprite.animation = "explode"
		


func _on_AnimatedSprite_animation_finished():
	if $CollisionShape2D/AnimatedSprite.animation == "explode":
		queue_free()
