extends Area2D
@onready var anim: AnimationPlayer = $AnimationPlayer
#@onready var collect_sound: AudioStreamPlayer = $collected-sound

var collected := false

func _ready():
	connect("body_entered", self, "_on_body_entered")
	anim.connect("animation_finished", self, "_on_animation_finished")

func _on_body_entered(body: Node2D) -> void:
	if collected:
		return

	if body.is_in_group("player"):
		collected = true
		#collect_sound.play()
		anim.play("collect")
		
func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "collect":
		queue_free()
