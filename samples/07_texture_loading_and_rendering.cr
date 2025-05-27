require "../src/sdl"
require "../src/image"

SDL.init(SDL::Init::VIDEO); at_exit { SDL.quit }
SDL::IMG.init(SDL::IMG::Init::PNG); at_exit { SDL::IMG.quit }

window = SDL::Window.new("SDL Tutorial", 640, 480)
renderer = SDL::Renderer.new(window)
texture = SDL::IMG.load(File.join(__DIR__, "data", "07_texture_loading_and_rendering", "texture.png"), renderer)

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    break if event.mod.lctrl? && event.sym.q?
  end

  renderer.draw_color = SDL::Color[255, 0, 0, 255]
  renderer.clear

  renderer.copy(texture, dstrect: SDL::Rect[50, 50, 300, 220])

  renderer.present
end
