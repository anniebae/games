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

function createDivForLetters(word){

	for (var i = 0; i < word.length; i++) {
		var div = document.createElement("div");
		div.style.width = "50px";
		div.style.height = "50px";
		div.style.background = "white";
		div.style.border = "solid 1px gray";
		div.style.display = "inline-block";
		div.innerHTML = word[i];
		$('#random-word').append(div);
	};
};

$(function(){
	$('.new-game').on("click", function(e){
		e.preventDefault();
		randomWord();
	});
});
