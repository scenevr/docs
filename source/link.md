---
title: Link
primary_navigation: true
---

# Link

A link is a floating globe that when clicked, turns into a portal to another scene. It inherits from [Element](/element.html).

## Sample XML

```xml
<link href="/challenge.xml" position="-0.8 1 2" rotation="0 1.57 0" />
```

## Screenshot

<img src="/images/link.png" class="screenshot" />

## Attributes

### rotation

The rotation of a link is important, because even though links are represented as spheres, when they are opened, they become a 2 dimensional circle, and players can only enter a portal by going into the sphere perpendicularly, so you must rotate the link to make it possible for players to run through it.

### href

This is the destination url. These urls are merged with the url of the current scene, so you can use relative urls like `/next-scene.xml` to link to another scene in the current scenes directory, or a complete url like `ws://home.scenevr.hosting/home.xml` to link to the home scene.

## Notes

When you go through a portal, a back link portal is generated at the spawn of the next scene, so you can go back to the previous scene. However, these portals go away if the page is reloaded. However, people can always use the back button to go back to a previous scene.