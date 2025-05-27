require "../src/sdl"

SDL.init(SDL::Init::VIDEO); at_exit { SDL.quit }

window = SDL::Window.new("SDL tutorial", 640, 480)
bmp = SDL.load_bmp(File.join(__DIR__, "data", "02_getting_an_image_on_the_screen", "hello_world.bmp"))

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    break if event.mod.lctrl? && event.sym.q?
  end

  bmp.blit(window.surface)
  window.update
end
