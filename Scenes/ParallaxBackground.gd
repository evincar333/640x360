extends ParallaxBackground

# Speed of the parallax scrolling
var scroll_speed = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Loop through each ParallaxLayer and adjust the offset
	for layer in get_children():
		if layer is ParallaxLayer:
			# Move the layer to the left
			var offset = layer.motion_offset
			offset.x -= scroll_speed * delta
			
			# If the layer has moved completely off-screen, reset its position
			if offset.x < -layer.get_child(0).texture.get_size().x:
				offset.x += layer.get_child(0).texture.get_size().x
			
			# Apply the offset
			layer.motion_offset = offset
