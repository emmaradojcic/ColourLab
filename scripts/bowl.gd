extends Node3D

# The mixing bowl. It catches orbs that are dropped into it.

# Sent when an orb lands in the bowl. Other scripts can listen for this.
signal colour_added(colour_name)

@onready var catcher = $Catcher


func _physics_process(_delta):
	# Check every orb that is inside the bowl right now.
	for body in catcher.get_overlapping_bodies():
		# Only take orbs that are loose (not held or floating at home).
		if body is Orb and body.is_loose():
			add_orb(body)


# Take one orb into the bowl.
func add_orb(orb):
	print("Added ", orb.colour_name)
	colour_added.emit(orb.colour_name)
	# Send the orb back to its starting spot.
	orb.respawn()
