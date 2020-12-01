document.addEventListener('DOMContentLoaded', () => {
	(function t() {
		var content = document.querySelector('article.post-content');
		if (content.innerHTML.length == 0) {
			setTimeout(t, 1);
			return;
		}

		content.innerHTML = content.innerHTML.replace(/<a href="(?!http:\/\/|https:\/\/)\/?([^"']*?)">/g, '<a href="wiki/$1">');
	})();
});
