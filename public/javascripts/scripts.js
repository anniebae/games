console.log('yay')

// ** Global **
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



// function emptyString(){
// 	for (var i = 0; i < word.length; i++){
// 		WordArray[i] = word.charAt(i);
// 		WordUArray[i] = " ";
// 	}
// 		WordU = WordUArray.join("");
// 		document.getElementById("random-word").innerHTML = WordU;
// 		document.getElementByClass("alphabet-letter").innerHTML = Word.length;
// }

// ****************** TROUBLE *********************
function guessLetter(guessed_letter){
	$.ajax({
		url: "/hangman/guess_letter",
		method: 'PATCH',
		dataType: "json",
		data: {letter: guessed_letter},
		success: displayLetter
		// success: function(json) {
		// 	debugger;
		// 	letter = json.letter;
		// 	displayLetter(letter);
		// }
	});
}

function displayLetter(letter){
	for (var i=0; i < word.length; i++){
	$letter.empty();
	$(letter).each(function(idx, letter){
		$letter.append(div);
	});

	}
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


// function updateLetter(letter){
// 	Updates = 0;
// 	for (var i = 0; i < word.length; i++){
// 		WordArray[i] = word.charAt(i);
// 		if(word.charAt(i) == letter){
// 			WordUArray[i] = letter;
// 			Updates += 1;
// 		}
// 	}
// }




$(function(){
	
	$('.new-game').on("click", function(e){
		e.preventDefault();
		$('#random-word').empty();
		randomWord();
	});

	$('.alphabet-letter').on("click", function(e){
		e.preventDefault();
		var guessed_letter = $(this).val();
		guessLetter(guessed_letter);
	})



});
