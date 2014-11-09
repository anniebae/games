console.log('yay')

// ***** Global *****
var word;
var corrects = [];
var incorrects = [];



function randomWord(){
	$.ajax({
		url: "/hangman/word",
		method: 'GET',
		dataType: "json",
		success: function(json) {
			word = json;
			createDivForLetters(word);
			incorrects = [];
			corrects = [];
		}
	});
}

function guessLetter(guessed_letter){
	$.ajax({
		url: "/hangman/guess_letter",
		method: 'PATCH',
		dataType: "json",
		data: {letter: guessed_letter},
		
		// data = {letter: 't'}
		success: function(data) {
			console.log(data) 
			checkLetter(data.letter);
			displayLetter(data.letter);
			if (data.lives <=0 ){
				alert('CAT: NOMNOMNOM ^.^')
			}
			if (data.complete){
				alert('MOUSE: YAAAAAY!')
			}
		}
	});
}

function checkLetter(letter){
	if (word.indexOf(letter) == -1 ){
		if (incorrects.indexOf(letter) < 0){
			incorrects.push(letter);
		}
	} else {
		if (corrects.indexOf(letter) < 0){
			corrects.push(letter);
		}
	}	
	displayGuessed();
}

function displayGuessed(){
	$correct = $(".good-guesses");
	$correct.text(corrects);
	$incorrect = $(".bad-guesses");
	$incorrect.text(incorrects);
}

function displayLetter(letter){
	for (var i=0; i < word.length; i++){
		if(word[i] === letter) {
			$($('#random-word div')[i]).text(letter);
		} 
	}
}




function createDivForLetters(word){

	for (var i = 0; i < word.length; i++) {
		var div = document.createElement("div");
		div.style.width = "50px";
		div.style.height = "50px";
		div.style.background = "white";
		div.style.border = "solid 1px gray";
		div.style.display = "inline-block";
		div.style.center
		// div.innerHTML = word[i];
		$('#random-word').append(div);
	};
};

