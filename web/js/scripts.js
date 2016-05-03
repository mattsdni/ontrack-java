function removeClassFromSemester(class_name, semester_name) {
	//get semester course list
	var semester_node = document.getElementById(semester_name+"courselist");
	//console.log(semester_node);

	//remove the right course
	var target = semester_node.getElementsByClassName("active")[0].remove();

	//TODO: fade out or something

}

//Adds a class to a semester
function addClassToSemester(class_name, semester_name) {
	var course_select = 'course' + class_name;
	var course_node = document.getElementById(course_select);

	//make a copy (so the course isn't removed from the course list)
	var course = course_node.cloneNode(true);
	
	//update id
	course.id += semester_name;

	var semester_node = document.getElementById(semester_name+"courselist");

	//get button
	var button = course.getElementsByClassName("collapsible-body")[0].getElementsByClassName("center-btn")[0].getElementsByClassName("btn")[0];
	
	//set button to 'remove'
	button.textContent = "Remove";
	
	//set button color to red
	button.className += " red";
	
	//set button functionality
	button.setAttribute('onclick','removeClassFromSemester("csce144", "fall2016")');

	//add to semester course list
	semester_node.appendChild(course);
}

function highlightSemester(semester_name) {
	//unhighlight all the other semesters
	var semesters = document.getElementsByClassName("semester");
	for (var i = 0; i < semesters.length; i++) {
		semesters[i].classList.remove("semesterselected");
	}

	//highlight semester
	document.getElementById(semester_name).className += " semesterselected";

	

}