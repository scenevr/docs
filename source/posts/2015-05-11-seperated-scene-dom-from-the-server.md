---
title: Seperated scene-dom from the server
date: 2015-05-11
layout: post
---
<div class="md"><p>More sexy backend changes that no-one except Ben and Sam will see, but we&#39;ve seperated the scene loading code from the server. The big goal here, is to make it so that you can load scene files directly in the client, and simulate them in the client.</p>

<p>This means that you can make Scenes without requiring a server. Sadly, these scenes will be single player only, but it makes it much easier for you to create scenes without having to install node.js and all that stuff. For example, we&#39;ve forked <a href="http://glslb.in/">glslbin</a> and are going to make <a href="https://github.com/scenevr/bin">bin.scenevr.com</a>, which will let you quickly hack up scenes in the browser. And then once you&#39;ve built something cool and want to put it online, you can deploy to heroku via one-click deploy.</p>

<p>I&#39;ve also been working on the new web client, which uses all the same rendering code, but has way nicer web interaction, like when you paste a link to a scene to reddit, twitter or facebook, you will get a pre-rendered screenshot of what the scene looks like. We also put a little summary of the scene (all the html content and links in it) in a &lt;noscript /&gt; tag, so that google can index your scene and you can use google site search to search for a scene that you found on scenevr.</p>

<p>Finally, we&#39;re working on making the reddit galleries work for any reddit gallery, not just the 3 pre-defined ones.</p>

<p>So there&#39;s been a bunch of behind the scenes work, but this will all lead to some nice user-facing features in the next few weeks.</p>
</div><br /><a href='http://www.reddit.com/r/scenevr/comments/35jlgl/seperated_scenedom_from_the_server/'>Read comments on reddit...</a>