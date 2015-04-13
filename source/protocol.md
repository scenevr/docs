---
title: Protocol
primary_navigation: true
---

# SceneVR Protocol

This document describes the SceneVR wire protocol. This document is mostly of interest to people build alternative SceneVR clients or servers.

## Overview

A SceneVR client connects to the server over websockets. As soon as a client connects, the server will send xml packets describing the scene.

## Websockets

To connect to a scene, connect to the url specified in the connect bar, with a websocket connection on port 8080. So for example this url:

    http://client.scenevr.com/?connect=chess.scenevr.hosting/chess.xml

You would establish a websocket connection to:

    ws://chess.scenevr.hosting:8080/chess.xml

You can also connect to port 80 for websockets, except some ISPs block websocket upgrade requests on port 80, so use 8080.

The `protocol` parameter of the websocket should be `scenevr`.

```javascript
var socket = new WebSocket("ws://chess.scenevr.hosting:8080/hello.xml", "scenevr");
```

## Packets

The first packet a client will recieve is the `ready` event. This will tell the client what UUID has been assigned for the player. This allows the client to identify the `<player />` object that is their own avatar, and not render it.

```xml
<packet><event name="ready" uuid="6693fc3e-cfba-43cb-a0f4-1e3a980d63a3" /></packet>
````

A client is responsible for physics and movement of their own avatar, so can ignore `<player />` packets about their own uuid.

## Packet format

Packets are valid xml wrapped inside a `<packet />` element. At this stage, SceneVR doesn't support nested transforms, so all elements inside the packet can be added directly to the scene. Some elements have `CDATA` elements inside them. eg:

```xml
<billboard uuid="a6d25ec5-42f5-41a5-95f9-040474ed8804" position="-2 1 0" rotation="0 1.5700000000000003 0" scale="2 2 0.25"> <![CDATA[ <h1>Welcome to SceneVR</h1> <p> There are two boxes for you to enjoy. One is <span style="color:#f70">orange</span> and one is <span style="color: #0af">aqua</span>. </p> <p> There are also some little voxel men, courtesy of @mikeloverobots. </p> <center> Enjoy <span style="background: #333; padding: 5px; display: inline-block; color: #f70">VR</span> ! </center> ]]> </billboard>
```

The CData is used so that the clients don't have to decode html inside `<billboard />` tags twice, but can instead recieve it as text, then pass it onto a html renderer. (Due to browser security limitations, billboards cannot have iframes, inputs, embeds etc, they are best treated as a static texture).

## Create / update / delete

The server does not maintain a list of what elements the client has scene, but instead sends all changing elements to the client, whenever an element changes. So for example - the teapot in the [homeroom](http://client.scenevr.com/) has a `setInterval` that continuously rotates the teapot. This means that the `rotation` attribute of the `<model />` is constantly changing. That means that at 10hz (the current update frequency), the element is sent to all connected clients.

To process a packet, the client parses the packet, then for each child element, looks up first:

### Is it an element we have seen before?

```xml
<box uuid="7334d64b-3989-4ca5-bbc1-f05bc6704e6e" id="home" style="color: #555555" position="2.5 0.25 3.5" rotation="0 0 0" scale="1 0.5 1"></box>
```

If we look up the UUID and find this uuid in our local scenegraph, we need to make a decision. Have only the position and rotation of the element changed? If so, just interpolate the previous position and rotation to the new position and rotation (do the interpolation over the network timestep, currently 10hz, but in the future this will be server-definable).

To tell if only the position and rotation changed, you need to keep a copy of the parsed XML from when you created the object in your scenegraph. You can use a userData for this. For example (pseudocode):

```javascript
var packet = parseXML("<box uuid='1234...' position='1 1 1' style='color: #f0a' />");
var box = new OpenGL.Box()
box.position = StringToVector(packet.position);
box.setColor(packet.style..color)
box.userData = packet;
```

In this pseudocode, we can then do a test when we recieve a new packet. If only the `position` and `rotation` attribute have changed, then we can interpolate the existing element. If the style attribute has changed, then we need to destroy and regenerate the element, to apply the new styles.

The if_substantial_change then destroy_and_regenerate is a very naive way to make sure that the scenegraph reflects the current server state of an element, but it is the easiest way to get started. Feel free to optimise this step as you see fit.

### Is it an element we haven't seen before?

```xml
<box uuid="7334d64b-3989-4ca5-bbc1-f05bc6704e6e" id="home" style="color: #555555" position="2.5 0.25 3.5" rotation="0 0 0" scale="1 0.5 1"></box>
```

Using the uuid attribute, we look up to see if we have this element in our local scenegraph. If we don't, then we create the element and add it to our scenegraph with the uuid attribute so that we can look it up in the future. The attributes of an element are parsed as per their description in the relevent API docs on scenevr.com. 

*The wire serialization of elements is identical to the markup used to define a scene*. The only addition it the uuid which is only used for wire serialization.

### Is it a `<dead />`?

```xml
<dead uuid="1234-1234-1234-1234" />
```

If it is a dead packet, look up the corresponding object in our local scenegraph by using the uuid attribute, and remove that object from the scenegraph. This is an instanteneous action, no need to fade out the object, just prune it from the scenegraph and the physics simulation.

### Is it an `<event />`?

```xml
<event name="ready" uuid="6693fc3e-cfba-43cb-a0f4-1e3a980d63a3" />
```

Events are basically remote procedure calls, and are treated seperately from other elements in the packet. See *events* below.

## Send player position

At the server update frequency (currently 5hz), the client should send the current position of the player. This packet is sent like this:

```xml
<packet><player position="1 2 3" rotation="0 1.571 0" /></packet>
```

Only the position and rotation attributes are considered by the server. There is no need to send the UUID with the player packet. To keep the load easier on the server, you should bundle together player updates with events that you are going to send, and send them all in one packet at the server update frequency (10hz).

## Send click events

If the player clicks on an element, send the click event, with the UUID of the element that was clicked:

```xml
<packet><event name="click" uuid="1234..." point="1 2 3" /></packet>
```

The point is a Vector that represents the point at which the player clicked on the element. This is important for the chessboard for example, to work out where on the board the player clicked.

## Send collide events

If the player collides with an element (touches it), send a collide event. You should only send a collide event every time the player touches a different object. If a player jumps off an object and lands on the same object, you should send another collide event, but throttled so that you don't send two collide events for the same UUID more than once every 500ms.

See `addPlayerBody` in client.js in the web client for more details on this.

The normal is a vector pointing from the object in the direction of the player, representing the direction the object is pushing against the player.

```xml
<packet><event name="collide" uuid="1234..." normal="-1 -2 -3" /></packet>
```

## Send chat events

To post a message to the chat channel for the current scene, send a chat element.

```xml
<packet><event name="chat" message="I love big butts and I cannot lie" /></packet>
```

Players are anonymous by default, so your chat messages will be posted anonymously. See authentication below.

## Receieve chat message

A chat message is recieved like this:

```xml
<packet><event name="chat" from="toastman" message="I love big butts and I cannot lie" /></packet>
```

## Recieve respawn event

If a player 'dies' (this event is usually triggered by game logic, eg when you collide with a ghost in puckman), you should `respawn` them, send them back to the spawn point, and add a message to the chat log saying why they died.

```xml
<packet><event name="respawn" reason="you touched a deadly ghost" /></packet>
```

## Restart event

If you are connected to a local scenevr server that is running in development mode (the default), then when the server detects a change to the scene files (because you pressed save in your editor), it sends a restart event to all connected clients.

```xml
<event name="restart" />
```

If the client recieves this message, it should disconnect from the server, remove all objects in the local scenegraph, then reconnect 1000ms later to the server. The player should stay where they are and not respawn (ignore the `<spawn />` element) but the scene should reload around the player.

## Authentication

Authentication is achieved by presenting a web surface (an iframe in the web client) that points at:

    http://login.scenevr.com/

This is the scenevr login server. Once the player logs in, the login server uses postMessage to say that the player is now logged in and you can request an authentication token.

```html
<script>
  window.parent.postMessage(JSON.stringify({ 
    message : "auth"
  }), "*");
</script>
```

You should write a hook that detects a call to `postMessage`, you can now trust that the player is logged in.

You need to save the session cookies set for the domain `login.scenevr.com`, these are used in the next step to get a token to authenticate with the current room.

Using the cookies, you can see if the user has logged in by resquesting:

  http://login.scenevr.com/session/status.json

If you have set the cookies correctly and formed the request, this will return json like:

```javascript
{"name":"toastman","id":16}
```

Note that the login server currently doesn't use SSL, but SSL will be added and *required* soon.

## Get an authentication token

Using these cookies - do a `GET` request to this url:

  http://login.scenevr.com/session/token.json?host=chess.scenevr.hosting

The server will respond like so:

```javascript
{"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJuYW1lIjoidG9hc3RtYW4iLCJob3N0IjoiY2hlc3Muc2NlbmV2ci5ob3N0aW5nIiwiZXhwIjoxNDI4OTY1MDk1fQ.lc4qinaxMONPTV0mGUIW6JkOTeCGj0rV5VTiDT3Ywlr7r8nuHrw48zabPt0l7-VHs5IQDXvSl3_2NXE47I51Kg"}
```

This is a [json web token](http://jwt.io/) that is signed by the servers private key. All SceneVR servers have the login servers public key embedded in them, so can prove that this is a valid token for authenticating the user to this SceneVR server at this time. Tokens expire after a specified period, so you should get a new token every time you connect to a scene and want to authenticate the user.

## Sending tokens to the server

To authenticate the client - send the value of the token to the server:

```xml
<packet>
  <event name="authenticate" token="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJuYW1lIjoidG9hc3RtYW4..." />
</packet>
```

The client should now be authenticated and you can post messages to the chat channel and you will appear as that player. You will also have your name above the pegman avatar when people see you.

## OpenTok

We use opentok / webrtc for voice chat. This section will be added later... Email ben to remind him to finish this if you need details.

