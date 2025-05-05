extends Node
class_name AudioRandomizer

var rng := RandomNumberGenerator.new()

var fs_speed_folders
var fs_speed_dict: Dictionary
var fs_fast: Dictionary
var fs_medium: Dictionary
var fs_slow: Dictionary
var bass_hits: Dictionary
var bassy: Dictionary
var ls_on: Dictionary
var ls_off: Dictionary
var potlid: Dictionary
var scrapes: Dictionary
var stingers: Dictionary
var thun: Dictionary
var growl: Dictionary

@onready var am: AudioManager = get_parent()

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_PAUSABLE
	add_to_group("Randomizer")
	fs_speed_folders = am.footstep_fx
	for folder in fs_speed_folders:
		fs_speed_dict.get_or_add(folder, 1)
	for effect in am.fs_fast:
		fs_fast.get_or_add(effect, 1)
	for effect in am.fs_medium:
		fs_medium.get_or_add(effect, 1)
	for effect in am.fs_slow:
		fs_slow.get_or_add(effect, 1)
	for effect in am.bassy_fx:
		bassy.get_or_add(effect, 1)
	for effect in am.scrape_fx:
		scrapes.get_or_add(effect, 1)
	for effect in am.stinger_fx:
		stingers.get_or_add(effect, 1)
	for effect in am.ls_fx_on:
		ls_on.get_or_add(effect, 1)
	for effect in am.ls_fx_off:
		ls_off.get_or_add(effect, 1)
	for effect in am.thun_fx:
		thun.get_or_add(effect, 1)
	for effect in am.growl_fx:
		growl.get_or_add(effect, 1)

func _choose_footstep() -> String:
	print(str(Time.get_ticks_msec()) + ": " + str(gb.difficulty))
	if gb.difficulty > .90:
		for key in fs_speed_dict:
			if key == "Fast/":
				fs_speed_dict[key] = 0
			if key == "Medium/":
				fs_speed_dict[key] = 0.5
	elif gb.difficulty > .50:
		for key in fs_speed_dict:
			if key == "Slow/":
				fs_speed_dict[key] = 0.5
			if key == "Fast/":
				fs_speed_dict[key] = 0.5
	elif gb.difficulty > .25:
		for key in fs_speed_dict:
			if key == "Slow/":
				fs_speed_dict[key] = 0
			if key == "Medium/":
				fs_speed_dict[key] = 0.5
	print(str(Time.get_ticks_msec()) + ": " + str(fs_speed_dict))
	var speed = fs_speed_dict.keys()[rng.rand_weighted(fs_speed_dict.values())]
	speed = "res://audio/Footsteps/" + speed
	print(str(Time.get_ticks_msec()) + ": " + speed)
	match speed:
		"res://audio/Footsteps/Fast/":
			var effect = fs_fast.keys()[rng.rand_weighted(fs_fast.values())]
			for fx in fs_fast.keys():
				if fx == effect:
					fs_fast[fx] -= 0.5
				else:
					if fs_fast[fx] < 1:
						fs_fast[fx] +=  0.25
			return speed + effect
		"res://audio/Footsteps/Medium/":
			var effect = fs_medium.keys()[rng.rand_weighted(fs_medium.values())]
			for fx in fs_medium.keys():
				if fx == effect:
					fs_medium[fx] -= 0.5
				else:
					if fs_medium[fx] < 1:
						fs_medium[fx] +=  0.25
			print(str(Time.get_ticks_msec()) + ": " + str(fs_medium))
			return speed + effect
		"res://audio/Footsteps/Slow/":
			var effect = fs_slow.keys()[rng.rand_weighted(fs_slow.values())]
			for fx in fs_slow.keys():
				if fx == effect:
					fs_slow[fx] -= 0.5
				else:
					if fs_slow[fx] < 1:
						fs_slow[fx] +=  0.25
			print(str(Time.get_ticks_msec()) + ": " + str(fs_slow))
			return speed + effect
	return "res://audio/Footsteps/Slow/fsslow4.ogg"

func _choose_ls_on() -> String:
	var effect = ls_on.keys()[rng.rand_weighted(ls_on.values())]
	for key in ls_on.keys():
		if key == effect:
			ls_on[key] -= 0.5
		else:
			if ls_on[key] < 1:
				ls_on[key] += 0.25
	effect = "res://audio/Lightswitch/On/" + effect
	return effect

func _choose_ls_off() -> String:
	var effect = ls_off.keys()[rng.rand_weighted(ls_off.values())]
	for key in ls_off.keys():
		if key == effect:
			ls_off[key] -= 0.5
		else:
			if ls_off[key] < 1:
				ls_off[key] += 0.25
	effect = "res://audio/Lightswitch/Off/" + effect
	return effect
	
func _choose_thun() -> String:
	var effect = thun.keys()[rng.rand_weighted(thun.values())]
	for key in thun.keys():
		if key == effect:
			thun[key] = 0
		else:
			if thun[key] < 1:
				thun[key] += 0.25
	effect = "res://audio/Thunder/" + effect
	return effect

func _choose_growl() -> String:
	var effect = growl.keys()[rng.rand_weighted(growl.values())]
	for key in growl.keys():
		if key == effect:
			growl[key] = 0
		else:
			if growl[key] < 1:
				growl[key] += 0.25
	effect = "res://audio/Growls/" + effect
	return effect
