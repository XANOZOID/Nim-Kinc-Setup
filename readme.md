# Nim bindings with Kinc

This is just a really rough set up for Nimlang integrating into a Kinc c-file project.

It's a throw-away I was using to learn Nim and Kinc at about the same time. It's 
messier than any project I'd ever like to 


If things aren't working just let me know. I'm not really focused on this anymore and 
there might have been something I forgot to add to this setup.


## First

- Install Node
- Due to modules, clone this repo _recursively_
- Run command `node kinc/make` from project root


## Basics

Pretty much what we're doing is just export the nim to C code. Take a look at nimgen.bat.

You should see your exported files inside of Sources/nim.

Sources/Shader.c is the entrypoint of the entire setup. 

Then, using visual studio, build the project for your platform. This project does not use a Kinc dll.


## Other

Also see nimlib/readme.md 


The graphics (the .png files) in the Deployment folder are not my own.