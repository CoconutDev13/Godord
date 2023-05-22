extends Node

class_name TokenManager

enum ERROR {
	OK,
	OPEN_ERROR,
	PARSING_FAILED,
	MISSING_TOKEN,
}

var token : String
var error : int = 0

func _init():
	var file : FileAccess = FileAccess.open("res://config.json", FileAccess.READ)
	
	if file == null:
		print(FileAccess.get_open_error())
		error = ERROR.OPEN_ERROR
		return

	var content : String = file.get_as_text()
	
	var json : Variant = JSON.parse_string(content)
	if json == null:
		print("Parsing configuration json failed. Probably invalid format")
		error = ERROR.PARSING_FAILED
		return

	if not json.has("TOKEN"):
		print("Token is missing")
		error = ERROR.MISSING_TOKEN
		return
		
	token = json.TOKEN
	error = ERROR.OK

func get_error_code() -> int: return error
