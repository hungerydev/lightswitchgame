extends RichTextLabel

func _process(delta: float) -> void:
	install_effect(difficulty_text_effect.new())
	var color = "RED" if $"../difficulty_slider".value > -0.5 else "YELLOW"
	
	text = "[difficulty freq=%s" % $"../difficulty_slider".value + " color=%s" % color + "]DIFFICULTY[/difficulty]" 
	
