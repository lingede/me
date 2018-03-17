$(document).ready(function () {
	var _contentList = $("#contentList li").toArray();
	var _contentArea = $(".contentArea").toArray();
	currentArea = $(_contentArea[0]);
	currentTitle = $(_contentList[0]);

	currentTitle.addClass("selected");

	for (var i = 0; i < _contentList.length; i++) {
		_contentList[i].onmousedown = function () {
			var _this = $(this);
			currentTitle.removeClass("selected");
			currentTitle = $(_contentList[_this.index()]);
			currentTitle.addClass("selected");
			currentArea.css("display", "none");
			currentArea = $(_contentArea[_this.index()]);
			currentArea.css("display", "block");
		}
	};
})