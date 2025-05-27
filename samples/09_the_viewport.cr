require "../src/sdl"
require "../src/image"

SDL.init(SDL::Init::VIDEO)
at_exit { SDL.quit }

SDL::IMG.init(SDL::IMG::Init::PNG)
at_exit { SDL::IMG.quit }

window = SDL::Window.new("SDL tutorial", 640, 480)
renderer = SDL::Renderer.new(window)

png = SDL::IMG.load(File.join(__DIR__, "data", "09_the_viewport", "viewport.png"), renderer)

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    break if event.keyup? && event.sym.q?
  end

  # clear sreen in white
  renderer.draw_color = SDL::Color[255, 255, 0, 255]
  renderer.clear

  # top left
  renderer.viewport = SDL::Rect[20, 20, 290, 210]
  renderer.copy(png)

  # top left
  renderer.viewport = SDL::Rect[330, 20, 290, 210]
  renderer.copy(png)

  # bottom
  renderer.viewport = SDL::Rect[20, 250, 600, 210]
  renderer.copy(png)

  renderer.present
end
