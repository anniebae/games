console.log('yay')

// ***** Global *****
var word;


function randomWord(){
	$.ajax({
		url: "/hangman/word",
		method: 'GET',
		dataType: "json",
		success: function(json) {
			word = json;
			createDivForLetters(word);
		}
	});
}

// ****************** TROUBLE *********************
function guessLetter(guessed_letter){
	$.ajax({
		url: "/hangman/guess_letter",
		method: 'PATCH',
		dataType: "json",
		data: {letter: guessed_letter},
		success: displayLetter
	});
}


function displayLetter(letter){
	for (var i=0; i < word.length; i++){
		if(word[i] === letter) {
			$($('#random-word div')[i]).text(letter);
		}
	}
}



function updateGuessesBox(letter){
	var letterDiv = $('<div>').addClass('good-guess').text(letter);
	$('.good-guesses').append(div);
	$('.bad-guesses').append(div);
}
// ****************** TROUBLE *********************

function createDivForLetters(word){

	for (var i = 0; i < word.length; i++) {
		var div = document.createElement("div");
		div.style.width = "50px";
		div.style.height = "50px";
		div.style.background = "white";
		div.style.border = "solid 1px gray";
		div.style.display = "inline-block";
		// div.innerHTML = word[i];
		$('#random-word').append(div);
	};
};

