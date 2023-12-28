# Flappy Bird Clone ![Godot 4.1](https://img.shields.io/badge/godot-v4.1-blue)

[Play it here!](https://ngli.itch.io/flappybird)

#### HTML5
For exporting to html5, set 'Canvas Resize Policy' to 'Project'. This prevents the browser from showing outside the viewport boundaries. 

Aside from that, running the project will give this error:
> Error \
> The following features required to run Godot projects on the Web are missing: \
> Cross Origin Isolation - Check web server configuration (send correct headers) \
> SharedArrayBuffer - Check web server configuration (send correct headers)

To fix this, [Fernando Gimenez](https://github.com/pijamarda) provided a [python script](https://github.com/godotengine/godot/issues/69020). Run server.py with `python server.py`.

Then, through `http://localhost:8000/build/flappybird.html` (assuming there is a build folder and an exported html file), you can access the game. 

Alternatively, you can go to `localhost:8000` and navigate to the built html file to load it.

#### Project Controls:
- Move with 'Space' or 'Left-Click'
- Select options with 'Left-Click'

#### Credits:
- Textures from [Samuel Custodio](https://github.com/samuelcust/flappy-bird-assets)
- Thanks to the community for providing a guide, tutorial and documentation, which I frequently referenced.
