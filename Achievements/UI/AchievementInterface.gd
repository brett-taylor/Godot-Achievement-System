extends MarginContainer

const ACHIEVEMENT_ITEM = "res://Achievements/UI/AchievementItem.tscn";

var achievementPanel = null;
var achievementsNodes = {};

func init(achievements):
	achievementPanel = $Background/Layout/MarginContainer/Panel/MarginContainer/ScrollContainer/VBoxContainer;
	for i in achievements:
		var achievement = load(ACHIEVEMENT_ITEM).instance();
		achievement.set_achievement(achievements[i]);
		achievementsNodes[i] = achievement;
		achievementPanel.add_child(achievement);

func _on_Button_pressed():
	hide();
