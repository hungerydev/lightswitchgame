extends RichTextEffect
class_name rng_note

var bbcode = "rng"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var opacity = char_fx.env.get("opacity", 1)
	
	char_fx.color.a = opacity
	return true
