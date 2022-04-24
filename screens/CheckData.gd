extends Control

var ROMDB = load("res://scripts/ROMDB.gd").new()

func _ready():
	add_text("Checking Config files and Rom database...")
	var err = ROMDB.load_rom_db() 
	if err == OK:
		add_text("All is OK!")
		# set paid to true by default in Vars.gd, link back to original project under links, and encourage to support instead.
		if Vars.paid:
			SceneChanger.change_scene("res://screens/MainMenu.tscn")
		else:
			SceneChanger.change_scene("res://screens/BuyLauncher.tscn")
	else:
		add_text( "Error loading roms.db: %d" % [err] )

func add_text(txt=""):
	print(txt)
	#$Margin/VBx/Lbl.text += txt
