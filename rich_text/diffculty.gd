@tool
extends RichTextEffect
class_name difficulty_text_effect

var bbcode = "difficulty"

func _process_custom_fx(char_fx: CharFXTransform) -> bool:
	var speed = char_fx.env.get("freq", 5.0)
	var color = char_fx.env.get("color", Color(1,1,1,1))
	
	char_fx.offset = Vector2(randf_range(0,1)*(speed+1)*5,randf_range(0,1)*(speed+1)*5)
	char_fx.color = color
	return true
