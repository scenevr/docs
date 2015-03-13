---
title: 0.2.0 - Usernames
date: 2015-03-10
layout: post
---

Just deployed version 0.2.0 of the SceneVR server. It now supports usernames! [Claim a username](//login.scenevr.com/users/sign_up) now at login.scenevr.com.

## Behind the scenes

I've been thinking about authentication for scenevr for a long time. Initially I thought of just letting people name themselves whatever they want, with name collisions, and no promise that the person is who they say they are, but I didn't like that idea, because I wanted to be able to do authentication on names (eg, if `player.name=='bnolan'` then they can do god-mode stuff to the scene). So I had a hack at doing an authentication server using oauth or openid, but to be honest, they're just so fucking complicated, and didn't have good support for automatically granting tokens. So eventually I settled on a solution using [JSON Web Tokens](http://jwt.io/) which came together quickly and works well. I also updated the renderer so that if a `<player />` has their name attribute set, then they will have a name above them, and their name will show up in the chat logs.

<img src="/images/blog/usernames.png" class="screenshot" />

## Anonymity

I like [this post](https://highfidelity.com/blog/2014/03/identity-in-the-metaverse/) by high fidelity. Basically, you shouldn't be forced to display your username while you wander around scenes. Sure, in the [homeroom](//client.scenevr.com/) it's cool to have your name. But maybe if you're visiting /r/gentlemanboners, you're not so keen on everyone seeing you wander around the gallery.

That's why anonymity is built in to scenevr. You aren't required to log in to access scenes, and you can transition from authenticated (with a name over your avatar) to anonymous at any time, without leaving the room.

## Try it out!

So go try it out, just click the 'login' button in the top right of the [client](//client.scenevr.com) and you can sign up and then log in so that everybody in scenevr knows your name. It's like the bar in cheers. Talking of which, that'd make a good scene.

<img src="/images/blog/cheersbar.jpg" class="screenshot" />