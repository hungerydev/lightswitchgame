extends Node

@warning_ignore_start("unused_signal")
signal _light_on

signal _light_off

signal _remote_light_on

signal _remote_light_off

## Emitted by the main_menu scene in order to transition between pages
signal _menu_light_on
signal _menu_light_off

## Emitted by global variables any time the brightness setting is changed
signal _change_brightness(value)

## Emitted by brightness slider to tell world environment to show logos
signal _brightness_hover(value)

signal _monster_clicked

signal _event_start(event)

signal _event_finished

signal _event_override(event)

signal _manual_event_start

signal _rc_result(bool)

signal _hour_changed(hour)

signal _progress_calculated

signal _lightning_strike

signal _fail

signal _time_fail

signal _lightning_fail

signal _jumpscare_finished

## Emitted by res://text_sequences/drawing_sequences.gd when death text is done
signal _death_seq_finished

signal _monster_inactive
