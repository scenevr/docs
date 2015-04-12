---
title: Box
primary_navigation: true
---

# Box

A box is a simple cube. It inherits from [Element](/element.html).

## Sample XML

```xml
<box id="cubey" position="1 2 3" scale="1 1 1" style="color: #f07" />
```

## Screenshot

<img src="/images/box.png" class="screenshot" />

## Styles

### color

The color of the box. Can be set using hexadecimal code or color names. For example to set every box to be red, use the following code.

```javascript
document.getElementsByTagName("box").forEach(function(box){
    box.style.color = '#ff0000';
});
```

### texture-map

A texture map that is applied to the box. Texture-maps are lambertian shaded. Textures should be sized as a power of 2 (eg 256x256, 512x512).

```
style="texture-map: url(/images/crate.png)"`
```

### texture-repeat

How many times is the texture repeated in the U and V directions.

```
style="texture-map: url(/images/grid.png); texture-repeat: 100 100"
```
