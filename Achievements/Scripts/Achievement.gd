extends Node

var values = {};

func _init(values):
	self.values = values;

func set_value(key, value):
	values[key][key] = value;

func get_value(key):
	return values[key][key];

func is_key_user_data(key):
	if values[key].has("userData"):
		return values[key]["userData"];
	
	return false;

func get_name():
	if get_value("name") != null:
		return get_value("name");
	
	return "Name Not Set";

func get_desc():
	if get_value("desc") != null:
		return get_value("desc");
	
	return "Desc Not Set";

func get_progress():
	if get_value("progress") != null:
		return get_value("progress");
	
	return 0;
	
func get_total():
	if get_value("total") != null:
		return get_value("total");
	
	return 1;

func has_custom_progress_bar_colors():
	return values.has("progress-bar-background-color") && values.has("progress-bar-color");

func get_progress_bar_background_color():
	return Color(get_value("progress-bar-background-color"));

func get_progress_bar_color():
	return Color(get_value("progress-bar-color"));

func has_picture():
	return values.has("picture");

func get_picture_location():
	return get_value("picture");

func increment(amount):
	values["progress"]["progress"] = get_value("progress") + amount;