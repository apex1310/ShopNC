function selectTag(showContent,selfObj){
	// ������ǩ
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// ��������
	for(i=0; j=document.getElementById("tagContent"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}

function selectTagtw(showContent,selfObj){
	// ������ǩ
	var tag = document.getElementById("tagstw").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// ��������
	for(i=0; j=document.getElementById("tagContenttw"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}

function selectTagth(showContent,selfObj){
	// ������ǩ
	var tag = document.getElementById("tagsth").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// ��������
	for(i=0; j=document.getElementById("tagContentth"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}

function selectTagfo(showContent,selfObj){
	// ������ǩ
	var tag = document.getElementById("tagsfo").getElementsByTagName("li");
	var taglength = tag.length;
	for(i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// ��������
	for(i=0; j=document.getElementById("tagContentfo"+i); i++){
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}