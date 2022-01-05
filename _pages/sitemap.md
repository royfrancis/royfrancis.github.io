---
title: "Sitemap"
permalink: /sitemap/
author_profile: false
layout: archive
sitemap: false
---

A list of all the posts and pages found on this site.

<h2>Posts</h2>
{% for post in site.posts %}
  {% include sitemap-entry.html %}
{% endfor %}

<h2>Pages</h2>
{% for post in site.pages %}
  {% include sitemap-entry.html %}
{% endfor %}


