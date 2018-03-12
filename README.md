# Setup
Download elm for your platform : https://guide.elm-lang.org/install.html
Download elm-test using npm : https://www.npmjs.com/package/elm-test
(Download nodejs first if you are missing npm : https://www.npmjs.com/get-npm)

Use an IDE with Elm syntax highlighting. Choices :
- Intellij with Elm Language Plugin
- Atom with elm-package
- Something else

# Make
    elm-make src/Main.elm

# Run tests
    elm test --watch

# Run slides
  ./serve.sh
