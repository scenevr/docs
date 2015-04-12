---
layout: post
title: "Making a door"
date: 2015-04-13
---
 
I just put up a [gist of making a door](https://gist.github.com/bnolan/a740dccdde9c0d3cb5ad) using SceneQuery. There's a few things going on here. First up you'll need to download [scenequery](http://github.com/scenevr/scenequery) from github. Next up create two grey walls, and a pink door.

<img src="https://pbs.twimg.com/media/CCbX14DUAAAoaBX.png" class="screenshot" />

Then you need to add a `click` event handler to the door. We store the state of whether the door is opened or closed by using a css class. This doesn't actually have any effect on the display of the door, it's just a handy place to store some state.

Now, we could have the door open instantly, but its cooler if we take 1 second (1000 milliseconds) for the door to animate open. To do this, we use the `animate` method in SceneQuery. Note that at the moment you can only animate position and rotation. So we work out the state the door needs to move to, then animate the door. And boom! You have an animated dooor.

```html
<scene>
 
  <spawn position="0 0 10" />
 
  <box class="wall" style="color: #ccc" scale="10 4 0.2" position="-6 2 0" />
  <box class="wall" style="color: #ccc" scale="10 4 0.2" position="6 2 0" />
 
  <box class="door" style="color: #f07" scale="2 4 0.2" position="0 2 0" rotation="0 0 0" />
 
  <script src="scripts/scenequery.js" />
 
  <script>
    var door = $('box.door').addClass('closed');

    door.click(function (e) {
      var endRotation, endPosition;

      if (door.hasClass('closed')) {
        // open door
        endRotation = new Euler(0, -Math.PI / 2, 0);
        endPosition = new Vector(1, 2, -1);
        door.removeClass('closed');
      } else {
        // close door
        endRotation = new Euler(0, 0, 0);
        endPosition = new Vector(0, 2, 0);
        door.addClass('closed');
      }

      door.animate({
        rotation : endRotation,
        position: endPosition
      }, 1000);

    });
  </script>
</scene>
```

