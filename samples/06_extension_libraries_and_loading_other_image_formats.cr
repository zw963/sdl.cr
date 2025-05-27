require "../src/sdl"
require "../src/image"

SDL.init(SDL::Init::VIDEO); at_exit { SDL.quit }
SDL::IMG.init(SDL::IMG::Init::PNG); at_exit { SDL::IMG.quit }

window = SDL::Window.new("SDL Tutorial", 640, 480)

png = SDL::IMG.load(File.join(__DIR__, "data", "06_extension_libraries_and_loading_other_image_formats", "loaded.png"))
png = png.convert(window.surface)

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    break if event.mod.lctrl? && event.sym.q?
  end

  png.blit(window.surface)
  window.update
end
