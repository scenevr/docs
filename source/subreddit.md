---
title: Reddit
---

# Reddit Galleries in Virtual Reality

SceneVR converts web content into virtual reality spaces that you can share with your friends. Enter
the name of your favourite subreddit below to turn it into a virtual reality scene. Share the URL
of your scene with your friends, and you will see them when they join the scene.

<form action="#" class="enter-destination">
  <h3>Enter a subreddit:</h3>

  <p>
    Turn any reddit gallery into a virtual reality space that you can share with your friends.
  </p>

  <div>
    /r/ <input type="text" id="sub" value="aww" /> <button type="submit">Enter VR</button>
  </div>
</form>

## What will it look like?

Subreddit galleries will take any direct image
links and turn them into billboards that you can walk around and view. Galleries are viewed like
first person games if you are used to using them, where you use the WASD keys to move around,
and the mouse to look. If you are on mobile, you can navigate the galleries using two thumbpads.

<img src="/images/subreddit.png" class="screenshot" />
<cite>This is how subreddits appear in VR.</cite>

<img src="/images/friend.png" class="screenshot" />
<cite>This is how other people will appear in VR.</cite>

## How do I view it on my rift?

Oculus Rift support is currently being reworked to work better with the latest 0.6.0 driver release. We
will update this page when rift support is working.

## How do I view on google cardboard?

We currently don't have any google cardboard support, but we are working on it.

<script>
  $('form').submit(function (e){
    var sub = $('form #sub').val();
    window.location = 'http://scenevr.com/wss/scene-reddit.herokuapp.com/gallery.xml?subreddit=' + sub;
    e.preventDefault();
  });

  $('#sub').focus();
</script>

