function removeClassFromSemester(class_name, semester_name) {
	//get semester course list
	var semester_node = document.getElementById(semester_name+"courselist");
	//console.log(semester_node);

	//remove the right course
	var target = semester_node.getElementsByClassName("active")[0].remove();

	//TODO: fade out or something

}

//Adds a class to a semester
function addClassToSemester(semesterCardId, title, dept, course_num, credits, description, courseId) {
	var course = document.createElement("li");
	
	//update id
	course.id = courseId;

	//fill up the course with nutritious content
	var html = '<div class="collapsible-header active">' +
		'<div class="collapsible-header-title-left ' + dept + '">' + dept + ' ' + course_num + '</div>' +
		'<div class="collapsible-header-title-right"><span>' + credits + '</span></div>' +
		'</div>' +
		'<div class="collapsible-body" style="display: block;">' +
		'<h5 class="center-text">' + title + '</h5>' +
		'<p>' + description + '</p>' +
		'<div class="center-btn">' +
		'<a class="waves-effect waves-light btn red" onclick="deleteCourse(this.parentElement.parentElement.parentElement.id)">Remove</a>' +
		'</div></div>';

	course.innerHTML = html;

	//add to semester course list
	document.getElementById(semesterCardId).appendChild(course);
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