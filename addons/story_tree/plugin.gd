tool
extends EditorPlugin

const EDITOR_SCREEN = preload("res://addons/story_tree/scenes/editor_screen.tscn")

var editor_screen_instance


func _ready() -> void:
	OS.low_processor_usage_mode = true


func _enter_tree() -> void:
	editor_screen_instance = EDITOR_SCREEN.instance()
	get_editor_interface().get_editor_viewport().add_child(editor_screen_instance)
	make_visible(false)


func _exit_tree() -> void:
	if editor_screen_instance:
		editor_screen_instance.queue_free()


func has_main_screen():
	return true


func make_visible(visible):
	if editor_screen_instance:
		editor_screen_instance.visible = visible


func get_plugin_name():
	return "Story Tree"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("GraphEdit", "EditorIcons")
