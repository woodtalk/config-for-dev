document.addEventListener('DOMContentLoaded', () => {
	(function t() {
		var content = document.querySelector('article.post-content');
		if (content.innerHTML.length == 0) {
			setTimeout(t, 1);
			return;
		}

		content.innerHTML = content.innerHTML.replace(/\[\[(.+?)\]\]\{(.+?)\}/g, '<a href="wiki/$1">$2</a>');
		content.innerHTML = content.innerHTML.replace(/\[\[(.+?)\]\]/g, '<a href="wiki/$1">$1</a>');
	})();
});
