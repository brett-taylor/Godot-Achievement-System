# Basic Achievement System For Godot 3
A basic achievement system I made while trying out Godot.
![](https://raw.githubusercontent.com/brett-taylor/Godot-Achievement-System/master/Achievements/Example-Image/image-one.png)

# Features
- User interface listing all achievements and their current progress
- Loads achievments from a JSON file.
- Saves and loads user progress to and from a JSON file.

# Installation
- Download the achievements folder and drag it into your Godot project.
- The file: Achievements/Scripts/AchievementManager.gd must exist on a node or as a singleton.
    - To make it a singleton: Go to the toolbar Project > Project Settings.
    - Go to the AutoLoad tab and add it there.
- The action "" must be binded in the Input Map.
    - The Input Map can be reached via the toolbar Project > Project Settings > Input Map.
- Don't forget to include the Data/Default_Achievement_file.json to be built with your project.

# The JSON files
There exists two JSON files "Default_Achievement_File" and "Actual_Achievement_File". "Default_Achievement_File" handles the template of the achievement (e.g. the name and description) and can be found in "Achievements/Data". 
While, "Actual_Achievement_File" can be found in the "res://user" special godot directory and handles all user related information (e.g. the progress they have made). 
This seperation is useful as Godot guarantees whether the "Actual_Achievement_File" is stored it will be writable while the game folder may not be.

# Adding a achievement.
## Example:
These are currently all the elements the achievement system supports.
```JSON
"randomAchievementExampleOne": {
        "name": {
            "name": "Name Of Achievement"
        },
        "desc": {
            "desc": "Name Of Description"
        },
        "progress": {
            "progress": 0,
            "userData": true
        },
        "total": {
            "total": 100
        },
        "progress-bar-background-color": {
            "progress-bar-background-color": "#0c8c7f"
        },
        "progress-bar-color": {
            "progress-bar-color": "#12ccb9"
        },
        "picture": {
            "picture": "res://Achievements/Images/some-achievement-picture.png"
        }
    }
```
##### Notes:
- As you may have noticed each achievement property must be surrounded by a element of its same name.
- Each achievement property is by default has userData set to false. If "userData" is set to true this propety will be saved and loaded from the "Actual_Achievement_File" data file instead. In this case the value will be used as the starting value.
- The very top element (in the above case "randomAchievementExampleOne") will be the name you use to access the achievement (e.g. wanting to incremenet this ahcievement).

##### Compulsory Elements
- name
- desc
- progress
- total

##### Optional Elements
- progress-bar-background-color
- progress-bar-color
- picture

# Incrementing an achievement
```GAP
Node_That_Holds_Achievement_Manager.increment_achievement(achievement_name, amount);
```

