---
title: Semistandard
date: 2015-03-30
layout: post
---

So today was a fun productive day on SceneVR. I spent the weekend at a great node conference in christchurch, and met dominic tarr, substack, craig spence and feross (amongst others), and after seeing all their great work, I got inspired to tidy up the source code to the SceneVR server.

So now the code is semistandard compliant (semistandard is a great code linter based on standard, but with semicolons, because I prefer them).

The server for scenevr was originally written in coffeescript, and about 2 months ago, I transpiled it all to javascript, and started coding purely in javascript. However, there were still a few coffeescript classes left around (in the specs), and the javascript was pretty ugly, using weird `for()` loops instead of nice clean .forEach. So today I set up the package to lint with `semistandard` and fixed up the whole server, deleted a bit of unused code, and removed pretty much all the ex-coffeescript grossness.

While I was at it, I ported the specs from jasmine to using [tape](https://github.com/substack/tape) by substack. It's a great testing library, and super lightweight. I found a few weird errors while fixing up the tests, but they're all fixed up, and now the tests pass yay!

I added a little badge to the readme that shows that SceneVR gets about 1000 downloads a month on NPM, which is cool.

## Future

In the future for scenevr, I'd like to break the code into some smaller modules that can be independently published to NPM. This might be handy for people that want to make alternative scenevr servers, or want to use the scenevr code to write intelligent agents that connect to scenevr clients.

I'd also like to get rid of the forked Vector, Euler and Dom-Lite classes, and instead use the original versions from NPM, and just extend them as necessary to add code to them, instead of hacking up the source code. I think I can probably do this now that we use `object.observe`.

I'd like to replace the current `dirtyNodes` code with something modelled on the [mutationobserver](https://developer.mozilla.org/en/docs/Web/API/MutationObserver) API. That'd make the code a bit nicer, and I could release a nice module around that.

After talking with Dominic Tarr, he gave me some ideas about how to more efficiently send updates over the wire, and how to send nested elements efficiently. I'm really keen to have a go at this, since grouped transforms would be really handy for scene creation.

I'd also like to remove the current UUID code and move to using `nodeid` instead, because that'll be more space efficient on the wire, and because all node ids are generated on the server, there's no need to use UUIDs.

Productive day!