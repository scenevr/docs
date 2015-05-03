---
title: Replacing logins with something else...
date: 2015-05-01
layout: post
---
<div class="md"><p>I&#39;ve decided that running a login server, with username / password / captchas / email reset / etc isn&#39;t a key component of what we&#39;re trying to do with Scene.</p>

<p>The biggest problem is the friends list. When you log into scene, your friends should be highlighted in a different color, and you should be able to see which Scene they are in, and teleport straight to them to join them. To do this requires a social graph, and there are two options:</p>

<p><strong>Create a social graph</strong>, this would mean creating a way to add friends in Scene, and start to build up a network. This would be fun to code up, and valuable for Scene the company to own, but it&#39;d be a massive pain the ass, and how many people can be bothered re-adding all their friends to a new social network.</p>

<p><strong>Use an existing social graph</strong>. This is my preferred option. If you facebook login and instantly you can see where all your friends are in Scene, I think this is a big win.</p>

<p>Real names. In the first iteration of this functionality, I&#39;m going to get rid of handles, and when you&#39;re in Scene you&#39;ll appear with just your first name to identify you. This isn&#39;t going to be a long term solution, and nicknames will probably come back, but this is just a first cut to get things moving.</p>

<p>I&#39;ll also make it easier to switch between logged in and anonymous mode, so that if you want to go into bobs-porn-den, that won&#39;t show up on your friends radar. The radar app, that shows where your friends are and lets you warp to them will probably be a little node.js app that I&#39;ll put on github and anyone can run.</p>
</div><br /><a href='http://www.reddit.com/r/scenevr/comments/34gpfj/replacing_logins_with_something_else/'>Read comments on reddit...</a>