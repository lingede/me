$(document).ready(function () {
	_nav = $("#nav h2").toArray();
	_words = $("#words>div").toArray();
	currentWords = $(_words[0]);
	currentNav = $(_nav[0]);

	for (var i = 0; i < _nav.length; i++) {
		_nav[i].onmouseover = function () {
			var _this = $(this);
			currentNav.removeClass("selected");
			_this.addClass("selected");
			currentNav = _this;
			currentWords.css("display","none");
			$(_words[_this.index()]).css("display","block");
			currentWords = $(_words[_this.index()]);
		}
	};
})
