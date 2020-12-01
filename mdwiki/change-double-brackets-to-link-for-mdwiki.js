document.addEventListener('DOMContentLoaded', () => {
	var absolutePath = document.URL.replace(/^http:\/\/[a-zA-Z0-9-.:]+\/(mdwiki|mdwiki-slim)\.html#!(.+)\/.+\.md$/,'$2');
	if (absolutePath == document.URL) {
		absolutePath = '';
	}
	var mdwikiFileName = document.URL.match(/(mdwiki|mdwiki-slim).html/g)[0];

	(function t() {
		var content = document.body.querySelector('div[id="md-content"]');
		if (content.innerHTML.length == 0) {
			setTimeout(t, 1);
			return;
		}

		content.innerHTML = content.innerHTML.replace(/<a href="(?!http:\/\/|https:\/\/)\/?([^"']*?)">/g, '<a href="' + miwikiFileName + '#!' + absolutePath + '/./$1.md">$1</a>').replaceAll('/./','/');
	})();
});
