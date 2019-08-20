var categoryForm = $("#categoryForm");
var category = document.getElementById('category_id');

function categoryChange() {	
	
	
	
	if(!(category.value == "0" || category.value == null)) {		
		categoryForm.find("#categoryKeyword").val(category.value);
		categoryForm.submit();
	}
}
