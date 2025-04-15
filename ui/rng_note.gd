extends RichTextLabel

func _process(delta: float) -> void:
	install_effect(rng_note.new())
	var opacity = $"../rng_slider".value + 1
	
	text = "[rng opacity=%s" % opacity + "]Note: high amounts of RNG may result in unwinnable situations. Play at your own risk[/rng]"
