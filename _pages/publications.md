---
layout: page
permalink: /publications/
title: publications
description: Papers in reversed chronological order.
nav: true
nav_order: 2
---

<!-- _pages/publications.md: rendered from _data/cv.yml with the same template as the CV page -->

{% assign entries = site.data.cv.cv.sections.Publications %}

<div class="cv-pub-standalone">
{% include cv/publications.liquid %}
</div>
