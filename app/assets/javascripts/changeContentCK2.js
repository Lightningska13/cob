function changeContent(rt) {

	if (rt == "1") {
		document.getElementById("content_area").innerHTML = '<div class="field"><label for="resource_res"> Document</label>  <input id="resource_res" name="resource[res]" size="30" type="file" </div>';
			}
	if (rt == "2") {
		document.getElementById("content_area").innerHTML = '<div class="field"><label for="res_file_name">URL</label><br /><input type="text" id="resource_res_file_name" name="resource[res_file_name]" size="40" maxlength="254"> <span class="instructions"> e.g. http://www.amazon.com</span></div>';
	}
	if (rt == "3") {
		document.getElementById("content_area").innerHTML = '<input type="hidden" id="resource_res_file_name" name="resource[res_file_name]" value="Text">';
	}
}
