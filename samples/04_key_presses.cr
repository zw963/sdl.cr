require "../src/sdl"

SDL.init(SDL::Init::VIDEO); at_exit { SDL.quit }

window = SDL::Window.new("SDL tutorial", 640, 480)

surfaces = {
  default: SDL.load_bmp(File.join(__DIR__, "data", "04_key_presses", "press.bmp")),
  up:      SDL.load_bmp(File.join(__DIR__, "data", "04_key_presses", "up.bmp")),
  down:    SDL.load_bmp(File.join(__DIR__, "data", "04_key_presses", "down.bmp")),
  left:    SDL.load_bmp(File.join(__DIR__, "data", "04_key_presses", "left.bmp")),
  right:   SDL.load_bmp(File.join(__DIR__, "data", "04_key_presses", "right.bmp")),
}

bmp = surfaces[:default]

loop do
  case (event = SDL::Event.wait)
  when SDL::Event::Quit
    break
  when SDL::Event::Keyboard
    case event.sym
    when .up?
      bmp = surfaces[:up]
    when .down?
      bmp = surfaces[:down]
    when .left?
      bmp = surfaces[:left]
    when .right?
      bmp = surfaces[:right]
    when event.mod.lctrl? && event.sym.q?
      break
    else
      bmp = surfaces[:default]
    end if event.keyup?
  end

  bmp.blit(window.surface)
  window.update
end
