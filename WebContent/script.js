function move(url) {
	location.href=url;
}

var searchId = document.getElementById('inputText'); //찾을 내용
searchId.onkeyup = enterKey;
function enterKey() {
	var dy = document.getElementById('findMovie');
	if (event.keyCode == 13) { //엔터키를 눌럿을경우 실행
		var text = searchId.value; //찾을 내용
		//우선 모든 내용을 보이지 않게 함
		for (var i = 0; i < monsI.length; i++) {
			var div1 = monsI[i].parentElement;
			div1.style.display = "none"
		}
		for (var i = 0; i < tuesI.length; i++) {
			var div2 = tuesI[i].parentElement;
			div2.style.display = "none";
		}
		for (var i = 0; i < wedsI.length; i++) {
			var div3 = wedsI[i].parentElement;
			div3.style.display = "none";
		}
		for (var i = 0; i < thusI.length; i++) {
			var div4 = thusI[i].parentElement;
			div4.style.display = "none";
		}
		for (var i = 0; i < frisI.length; i++) {
			var div5 = frisI[i].parentElement;
			div5.style.display = "none";
		}
		if (text === '') {
			alert('해당하는 모든 내용입니다')
		}	
		if (dy.value === "reserv") {//전체 요일
			for (var i = 0; i < monsI.length; i++) {
				if (monsI[i].innerHTML.indexOf(text) != -1) {//해당 내용이 있는지 확인
					var div = monsI[i].parentElement; //li를 보이게함
					div.style.display = "block";
				}
			}
			for (var i = 0; i < tuesI.length; i++) {
				if (tuesI[i].innerHTML.indexOf(text) != -1) {
					var div = tuesI[i].parentElement;
					div.style.display = "block";
				}
			}
			for (var i = 0; i < wedsI.length; i++) {
				if (wedsI[i].innerHTML.indexOf(text) != -1) {
					var div = wedsI[i].parentElement;
					div.style.display = "block";
				}
			}
			for (var i = 0; i < thusI.length; i++) {
				if (thusI[i].innerHTML.indexOf(text) != -1) {
					var div = thusI[i].parentElement;
					div.style.display = "block";
				}
			}
			for (var i = 0; i < frisI.length; i++) {
				if (frisI[i].innerHTML.indexOf(text) != -1) {
					var div = frisI[i].parentElement;
					div.style.display = "block";
				}
			}
		}
	}
}


function popupOpen(movieid){
	var popUrl = "./showInfo?movieid="+movieid+".jsp";	//팝업창에 출력될 페이지 URL	
	var popOption = "width=500, height=800, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
}

