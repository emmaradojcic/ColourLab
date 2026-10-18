extends Node3D

# The mixing bowl. It catches orbs that are dropped into it.

# Sent when an orb lands in the bowl. Other scripts can listen for this.
signal colour_added(colour_name)

@onready var catcher = $Catcher


func _physics_process(_delta):
	# Check every orb that is inside the bowl right now.
	for body in catcher.get_overlapping_bodies():
		# Only take orbs, only once the player has let go,
		# and not ones we are already removing.
		if body is Orb and not body.is_picked_up() and not body.is_queued_for_deletion():
			add_orb(body)


# Take one orb into the bowl.
func add_orb(orb):
	print("Added ", orb.colour_name)
	colour_added.emit(orb.colour_name)
	# Remove the orb from the game.
	orb.queue_free()
