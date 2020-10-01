# Working build command:

```bash
# preferred (inside of nimlib folder)
nim c -c --noMain --noLinking --nimcache:Sources/nim/ --header:nimlib/main.h nimlib/main.nim


# if you want to keep your files in nimcache
nim c --cc:vcc --noMain --noLinking --header:listener.h listener.nim
```


# Connecting nim source with Kinc

First, include the nim-source directory . . . This should be handled by the kincfile.js
```js
project.addIncludeDir('C:/Users/<user>/.choosenim/toolchains/nim-1.2.4/lib');
```

### If above doesn't work:

- Take the path to your nim library (example)
`C:/Users/<example>/.choosenim/toolchains/nim-1.2.4/lib`
- Open up your solution
- Right click on your project ("Game" probably)
- Select properties > C/C++ > General
- Open "additional include directories" and add the nim library path
    - Apply, and that should be it


### If you kept your files in nimcache
Second, find the generated files from the build command in the cache folder andd add the c files to your project

1. In solution, right click project, then add existing file
2. Find the nimcache output, select the c files, and add to project **as link**
