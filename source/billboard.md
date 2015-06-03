---
title: Billboard
primary_navigation: true
---

# Billboard

A billboard is a white box that has an html page as a texture on the front face. It inherits from [Element](/element.html).

## Sample XML

```xml
  <billboard id="hello" position="0 1 0" scale="2 2 0.2"><![CDATA[
      <h1>Hello world</h1>
      <br />
      <center>
        <img src="images/smiley.png" />
      </center>
  ]]></billboard>
```

## Screenshot

<img src="/images/billboard.png" class="screenshot" />

## Scripting

You can change the content of a billboard `cdata` node by assigning to the `data` attribute. This will cause the billboard to be re-generated (for doing a scoreboard, or other dynamic data). Note that re-generating billboards can be expensive, try and not do it more than once per second.

```javascript
  document.getElementById("hello").firstChild.data = '<h1>It has all changed</h1>';
```

## Notes

The html content inside a billboard must be enclosed in a `<![CDATA[ ... ]]>` block. This is so that the scene parser doesn't have to try and parse all the html on the server, but can instead send it straight to the client, where the client renders it.

## Limitations

Because of [limitations](https://code.google.com/p/chromium/issues/detail?id=294129) in some browsers, scenevr cannot render the html directly to a texture, but instead uses [html2canvas](http://html2canvas.hertzen.com/) to convert the html into a texture. This means that scenevr only supports a subset of html. You cannot use `form`, `iframe`, `embed` or many other things. Also note that the html is only rendered once and you cannot interact with it. So you can't click on links embedded in the html, nor will animated gifs work correctly.

These are some pretty serious limitations, but the goal for billboards, is to have an easy way to render text, images and tables, which html is great for. Although it is possible to use css3 to embed fully interactive web pages in a scenevr scene, that has many limitations (it doesnt work in rift mode, depth sorting gets broken) and is extremely slow. Over time we expect more html features to be rendered correctly, and it would be cool to be able to interact with forms, but for now, just use billboards to render static text and images.

Billboards have a physical body, so you can collide with them. Most of the galleries just use plain billboards.