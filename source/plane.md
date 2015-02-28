---
title: Plane
primary_navigation: true
---

# Plane

A plane is a plane on the x-y axis, it's depth in the z dimension is 0. It inherits from [Element](/element.html). If you want a horizontal plane, rotate your plane by approximately `-1.5708` radians on the y axis as in the following example. Planes are finite, they will only be as large as the specified scale in the x and y dimensions.

## Sample XML

```xml
<plane style="texture-map: url(/images/stones.jpg); texture-repeat: 1000 1000;" scale="1000 1000 0" position="0 0.01 0" rotation="-1.5708 0 0" />
```

## Screenshot

<img src="/images/plane.png" class="screenshot" />

## Styles

### color

The color of the plane. 

### texture-map

A texture map that is applied to the plane. Texture-maps are lambertian shaded.

```
style="texture-map: url(/images/crate.png)"`
```

### texture-repeat

How many times is the texture repeated in the U and V directions.

```
style="texture-map: url(/images/grid.png); texture-repeat: 100 100"
```
