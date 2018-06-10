---
layout: page
title: Tools
permalink: /tools.html
---
<p>Below are lists of tools you can use for inspiration and as a template for your own organization. Of course, you shouldn't blindly copy any of these any more than you would blindly copy a Stack Overflow post. Use them for research, or to get you over the 'blank screen' problem.</p>

<p>Wrote a job description you like? Want to share your interview questions? Even if you just want to link to something on the web, <a href="contributing.html">pull requests</a> are welcome! If you want to contribute but aren't comfortable with Github, you can <a href="contributing.html#contact">contact me</a> and I'll help out.</p>
{% for collection in site.collections %}
  {% include collection.html %}
{% endfor %}
