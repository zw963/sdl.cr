require "../src/sdl"

SDL.init(SDL::Init::VIDEO)
at_exit { SDL.quit }

window = SDL::Window.new("SDL tutorial", 640, 480)

bmp = SDL.load_bmp(File.join(__DIR__, "data", "05_optimized_surface_loading_and_soft_stretching", "stretch.bmp")).convert(window.surface)

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    break if event.keyup? && event.sym.q?
  end

  bmp.blit_scaled(window.surface, dstrect: SDL::Rect[20, 20, 600, 440])
  window.update
end
