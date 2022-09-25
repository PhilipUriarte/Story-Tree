tool
extends EditorPlugin

const MainPanel = preload("res://addons/story_maker/scenes/story_maker_screen.tscn")

var main_panel_instance


func _ready() -> void:
	OS.low_processor_usage_mode = true


func _enter_tree() -> void:
	main_panel_instance = MainPanel.instance()
	get_editor_interface().get_editor_viewport().add_child(main_panel_instance)
	make_visible(false)


func _exit_tree() -> void:
	if main_panel_instance:
		main_panel_instance.queue_free()


func has_main_screen():
	return true


func make_visible(visible):
	if main_panel_instance:
		main_panel_instance.visible = visible


func get_plugin_name():
	return "Story"


func get_plugin_icon():
	return get_editor_interface().get_base_control().get_icon("GraphEdit", "EditorIcons")
