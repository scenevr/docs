---
title: Gamepad support and Deltas
date: 2015-03-02
tags: server
layout: post
---

Big news today. I merged in the Gamepad support pull request from @brodavi, so you can now walk around the scene using an xbox 360 controller. You need to click the `A` button before the gamepad will be recognized and the thumbsticks enabled.

Today I also committed the `deltas` branch.

### Before deltas

Before the delta branch, the scenevr server sent the state of *every single element in the scene* 5 times a second to every connected client.

### After deltas

Using a bunch of `object.observe` calls, the scenevr server now keeps track of what elements are changing (because they're animated, or responding to user behaviour) and only send those over the wire. This results in:

* Much lower CPU utilisation on the server
* Less network traffic
* Can support more concurrent users
* Simpler client side change detection

It's a big win, and although there are still a few bugs to iron out, it's deployed on scenevr.hosting and client.scenevr.com, so you can try it out now.

Note that this change requires that you upgrade your version of node to 0.12.0 (the latest release).

### Changed the face

@ujelleh had complained that the face was too creepy. So I replaced it with the look of disapproval face. 

ಠ_ಠ