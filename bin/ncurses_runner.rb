require 'ncurses'

# This class descrribes the menu pane to the right of the window
class MyMenuPane
  def initialize(ncurses_pane, *menu_items)
    @pane = ncurses_pane
    @menu_items = menu_items
  end

  def draw_menu(select_item)
    @pane.clear
    @pane.addstr "Main Menu"
    @menu_items.each_with_index do |label, i|
      if label == select_item
        @selected_item = label
        @pane.attron(Ncurses::A_REVERSE)
      end
      @pane.mvaddstr(i+2, 5, label)
      @pane.attroff(Ncurses::A_REVERSE)
    end
    @pane.mvaddstr(@menu_items.size*2+2, 5, "Press the up/down arrow keys to change selection")
    @pane.refresh
  end

  def select_previous
    index2select = @menu_items.index(@selected_item) - 1
    index2select = @menu_items.size - 1 if index2select < 0
    draw_menu(@menu_items[index2select])
  end

  def select_next
    index2select = @menu_items.index(@selected_item) + 1
    index2select = 0 if index2select >= @menu_items.size
    draw_menu(@menu_items[index2select])
  end
end
# This class describes intiial status pane.
class MyShowStatusPane
  def initialize(ncurses_pane)
    @pane = ncurses_pane
  end

  def draw_placeholder
    @pane.addstr("PLACEHOLDER_______")
    @pane.refresh
  end
end
# This class describes the logo pane to the left of the window
class MyLogoPane
  def initialize(ncurses_pane)
    @pane = ncurses_pane
  end

  def draw_banner(file)
    File.foreach(file).with_index do |line, line_num|
      @pane.move(line_num, 0)
      @pane.addstr(line)
    end
    @pane.refresh
  end
end

begin
  window = Ncurses.initscr
  Ncurses.cbreak
  Ncurses.keypad(window, true)

  rows, cols = [], []
  Ncurses.getmaxyx Ncurses.stdscr, rows, cols
  maxx = cols.first
  maxy = rows.first
  halfx = maxx / 2
  halfy = maxy / 2
  Ncurses.refresh

  # Create window panes
  left_Pane = Ncurses.newwin(maxy, halfx, 0, 0)
  upper_right_Pane = Ncurses.newwin(halfy, halfx, 0, halfx)
  lower_right_Pane = Ncurses.newwin(halfy, halfx, halfy, halfx)

  # Draw the left pane with the logo.
  brand_ui = MyLogoPane.new(left_Pane)
  brand_ui.draw_banner('./bin/seal')

  menu_ui = MyMenuPane.new(upper_right_Pane, "Load Voter Profile", "Create Voter Profile", "Show Subscription Lists")
  menu_ui.draw_menu("Load Voter Profile")

  show_ui = MyShowStatusPane.new(lower_right_Pane)
  show_ui.draw_placeholder

  Ncurses.refresh

  while ch = window.getch
    case ch
    when Ncurses::KEY_UP
      menu_ui.select_previous
    when Ncurses::KEY_DOWN
      menu_ui.select_next
    when Ncurses::KEY_ENTER
      menu_ui.selected_action
    end
  end
ensure
  Ncurses.endwin
end