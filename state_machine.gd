extends Node2D

enum {
	IDLE,
	NEW_DIR
	MOVE
}

const speed = 100
var current_state = IDLE
var dir = Vector2.RIGHT

func _ready():
	randomize()

func _process(delta):
	match current_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.DOWN])
		MOVE:
			move(delta)

func move(delta):
	position += dir * speed * delta

func choose(array):
	array.shuffle()
	return array.front()

func _on_Timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5, 2])
	current_state = choose([IDLE, NEW_DIR, MOVE])
