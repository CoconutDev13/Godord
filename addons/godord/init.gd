@tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton('APIS', 'res://addons/godord/APIS.gd')
	add_autoload_singleton('GatewayIntents', 'res://addons/godord/GatewayIntents.gd')
	add_autoload_singleton('Payloads', 'res://addons/godord/Payloads.gd')

func _exit_tree():
	remove_autoload_singleton('APIS')
	remove_autoload_singleton('GatewayIntents')
	remove_autoload_singleton('Payloads')
