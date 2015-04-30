---
title: .mtl support added!
date: 2015-04-09
layout: post
---
<div class="md"><p>You can now use .mtl files like this:</p>

<p>&lt;model obj=&quot;x.obj&quot; mtl=&quot;x.mtl&quot; /&gt;</p>

<p>If you link to images inside your mtls, you should use relative paths. This means you might need to open your .mtl file in a text editor and change the code like this:</p>

<p>newmtl armchair_part4</p>

<p>Ns 96.078431</p>

<p>Ka 0.000000 0.000000 0.000000</p>

<p>Kd 0.640000 0.640000 0.640000</p>

<p>Ks 0.500000 0.500000 0.500000</p>

<p>Ni 1.000000</p>

<p>d 1.000000</p>

<p>illum 2</p>

<p>map_Kd /textures/armchair_part4_d.jpg</p>

<p>This will load the textures from your /textures/ directory in your SceneVR scene.</p>

<p>This makes it way easier to create scenes with multiple materials in your .obj files. Check out the chairs in the homeroom, which now have fancy textures instead of just being a boring color.</p>
</div><br /><a href='http://www.reddit.com/r/scenevr/comments/31zfrd/mtl_support_added/'>Read comments on reddit...</a>