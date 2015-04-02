---
title: Getting Started
primary_navigation: false
position: 3
---

# Home

The scene server is a node.js app and requires npm to install dependencies. You'll need to install [node](//nodejs.org) and [npm](//npmjs.org) to get started. Scene server has been tested on Windows and OS X.

# Getting Started 

## Installing

    npm install -g scenevr

This will take a little while while the npm dependencies are downloaded. The `scenevr` executable will then be installed globally.

## Download sample scenes

[Download the sample scenes](https://github.com/scenevr/samples/archive/master.zip).

Unzip the sample scenes.

    cd / 
    unzip samples-master.zip 

Start the server:

    scenevr ./samples-master/

## Launch the webclient

Open the webclient and load the files served from your localhost:

&raquo; Open [client.scenevr.com](http://client.scenevr.com/?connect=localhost:8080/index.xml) for local files

## Edit the scene files

Open any of the scene files in your editor and make changes. 

Whenever you save the file in your editor, the `scenevr` app **detects that the file has changed and reloads the scene** in your browser. The scene files have an `.xml` extension, but if your editor supports it, you should set your editor to html mode, since the scene file format is more like html. 

## Host your finished scenes

Once you have your scenes working well locally, host them for everyone to see at:

&raquo; [SceneVR hosting](//scenevr.hosting)

Hosting is free for creative commons licensed content.

## Promote your scenes

Post your scene (the url to view the scene in client.scenevr.com) to [/r/scenevr](//reddit.com/r/scenevr) and we will add a link to them from the home room.