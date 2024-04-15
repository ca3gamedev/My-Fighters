extends Node



	
	
func Update():
	%rootfolder.text = %DATA.data["root"]
	%picturesize.text = str(%DATA.data["pics"].size())
	%id.text = str(%DATA.id)
	%FilePathLabel.text = %DATA.FilePath


func _on_load_button_up():
	%DATA.pics = true
	%LOAD2.show()
	

func SAVE():
	%DATA.pics = true
	%SAVE2.show()
	
	


func _on_save_2_file_selected(path):
	
	var file
	file = FileAccess.open(path, FileAccess.WRITE)
	
	if %DATA.pics:
		file.store_line(JSON.stringify(%DATA.data))
	else:
		file.store_line(JSON.stringify(%DATA.player))
	file.close()
	%SAVE2.hide()


func _on_load_2_file_selected(path):
	
	var file
	
	file = FileAccess.open(path, FileAccess.READ)
	
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	
	if %DATA.pics:
		%DATA.data = data
		%Pictures.text = str(%DATA.data)
	else:
		%DATA.player = data
		%FilePathLabel.text = str(%DATA.player["root"])
	
	
	%DATA.id = 0
	
	%LOAD2.hide()


func select(path):
	%DATA.data["pics"].append(%LOADpictures.current_file)
	%LOADpictures.hide()
	%Pictures.text = str(%DATA.data)


func _on_add_button_up():
	%LOADpictures.show()


func _on_new_button_up():
	var data = {
		"pics" : []
	}
	var player = {
	"root" : []
	}
	%DATA.data = data
	%DATA.player = player


func DIRSELECT(dir):
	
	%DATA.player["root"] = dir
	%FilePathLabel.text = str(%DATA.player["root"])
	
	%LOADRoot.hide()


func ROOTFOLDER():
	%LOADRoot.show()


func LOADROOT():
	%DATA.pics = false
	%LOAD2.show()


func SAVEROOT():
	%DATA.pics = false
	%SAVE2.show()
