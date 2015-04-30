---
title: Thinking of deprecating the hosting service...
date: 2015-04-30
layout: post
---
<div class="md"><p>Hey all,</p>

<p>I had a meet up with my advisors tonight @traskjd and @sminnee, and we talked through a bunch of stuff, and one of the things that I want to do is to turn off new signups for the hosting service, and instead make it way easier for people to deploy their scenes to heroku.</p>

<p>I&#39;ve come to this decision because in using scenevr locally, I find the hosting service to be a bit of a pain, because it&#39;s not easy to just create a new scene, then type a few lines and deploy it, instead you have to drag and drop into the browser, and every time you change one file, you have to reupload the entire scene.</p>

<p>I could fix this, but I think a better option would be to use Heroku, because then I could just type <code>git push heroku</code> and the new version of the scene would be online. This is a great step forward in workflow for anyone who is regularly working on scenes, and I want to promote more people to work on scenes, instead of just hacking them up once and letting them fallow.</p>

<p>On the negative side, is that some people consider heroku quite a technical tool to get started with. This isn&#39;t true though! This evening I added a <a href="https://devcenter.heroku.com/articles/heroku-button">deploy to heroku</a> button to Puckman:</p>

<p><a href="https://github.com/scenevr/puckman#deploy-to-heroku">https://github.com/scenevr/puckman#deploy-to-heroku</a></p>

<p>There you go, just click that button and set up your own free instance of puckman on heroku. I let heroku create a hostname for me and it hosted it at:</p>

<p><a href="http://still-inlet-1130.herokuapp.com/">http://still-inlet-1130.herokuapp.com/</a></p>

<p>You can go there and try out puckman.</p>

<p>So what does this mean for the hosting app? Well, I still have to do some investigation before I am ready to unreservedly recommend heroku for scenevr hosting, but if all goes well, i&#39;ll turn off new sign ups for the hosting service. I won&#39;t turn off the scenevr hosting any time soon, so current users will have months to move their content off, but you can look forward to a bunch of tutorials and some work on the code to make deploying your scenes regularly much much easier!</p>
</div><br /><a href='http://www.reddit.com/r/scenevr/comments/34e3o0/thinking_of_deprecating_the_hosting_service/'>Read comments on reddit...</a>