extends Panel

var progress_bar = null;
var progress_text = null;
var picture_parent = null;
var picture = null;

func set_achievement(achievement):
	progress_bar = $MarginContainer/HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/TextureProgress;
	progress_text = $MarginContainer/HBoxContainer/MarginContainer/VBoxContainer/MarginContainer/TextureProgress/Label;
	picture_parent = $MarginContainer/HBoxContainer/Picture;
	picture = $MarginContainer/HBoxContainer/Picture/TextureRect;
	
	set_text(achievement);
	update_progress_bar(achievement);
	set_custom_progress_bar_colors(achievement);
	set_or_remove_picture(achievement);
	progress_bar.max_value = achievement.get_total();

func set_text(achievement):
	$MarginContainer/HBoxContainer/MarginContainer/VBoxContainer/Name.set_text(achievement.get_name());
	$MarginContainer/HBoxContainer/MarginContainer/VBoxContainer/Description.set_text(achievement.get_desc());

func update_progress_bar(achievement):
	progress_bar.value = achievement.get_progress();
	update_progress_bar_text(achievement);

func update_progress_bar_text(achievement):
	if achievement.get_progress() >= achievement.get_total():
		progress_text.set_text("Completed!");
		return;

	progress_text.set_text("%s / %s" % [achievement.get_progress(), achievement.get_total()]);

func set_custom_progress_bar_colors(achievement):
	if achievement.has_custom_progress_bar_colors():
		progress_bar.texture_under = GradientTexture.new();
		progress_bar.texture_under.gradient = Gradient.new();
		progress_bar.texture_under.gradient.set_color(0, achievement.get_progress_bar_background_color());
		progress_bar.texture_under.gradient.set_color(1, achievement.get_progress_bar_background_color());

		progress_bar.texture_progress = GradientTexture.new();
		progress_bar.texture_progress.gradient = Gradient.new();
		progress_bar.texture_progress.gradient.set_color(0, achievement.get_progress_bar_color());
		progress_bar.texture_progress.gradient.set_color(1, achievement.get_progress_bar_color());

func set_or_remove_picture(achievement):
	if !achievement.has_picture():
		picture_parent.queue_free();
		return;
	
	var image = ImageTexture.new();
	image.load(achievement.get_picture_location());
	picture.texture = image;