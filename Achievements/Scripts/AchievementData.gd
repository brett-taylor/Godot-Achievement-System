extends Node

const DEFAULT_ACHIEVEMENT_DATA_FILE = "res://Achievements/Data/Default_Achievement_File.json";
const ACTUAL_ACHIEVEMENT_DIRECTORY = "user://Achievement System/";
const ACTUAL_ACHIEVEMENT_DATA_FILE = ACTUAL_ACHIEVEMENT_DIRECTORY + "Actual_Achievement_File.json";
const ACHIEVEMENT_SCRIPT = "res://Achievements/Scripts/Achievement.gd";

var achievements = {};

func _init():		
	achievements = get_default_achievements();
	load_actual_achievements();
	save();

func get_default_achievements():
	var file = File.new();
	file.open(DEFAULT_ACHIEVEMENT_DATA_FILE, File.READ);
	var data = parse_json(file.get_as_text());
	
	for key in data:
		var achievement = load(ACHIEVEMENT_SCRIPT).new(data[key]);
		data[key] = achievement;
	
	return data;

func load_actual_achievements():
	var file = File.new();
	file.open(ACTUAL_ACHIEVEMENT_DATA_FILE, File.READ);
	var data = parse_json(file.get_as_text());
	
	if data != null:
		for achievementName in data:
			if achievements[achievementName] != null:
				for property in data[achievementName]:
					if achievements[achievementName].is_key_user_data(property):
						achievements[achievementName].set_value(property, data[achievementName][property]);

func save():
	var dictSave = {};
	
	for entry in achievements:
		dictSave[entry] = {};
		for property in achievements[entry].values:
			if achievements[entry].is_key_user_data(property):
				dictSave[entry][property] = achievements[entry].get_value(property);

	var directory = Directory.new();
	directory.make_dir(ACTUAL_ACHIEVEMENT_DIRECTORY);

	var file = File.new();
	file.open(ACTUAL_ACHIEVEMENT_DATA_FILE, File.WRITE);
	file.store_string(to_json(dictSave));
	file.close();

func get_achievements():
	return achievements;