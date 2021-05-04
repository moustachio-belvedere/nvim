" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
  GuiPopupmenu 0
endif

" Fira code for nvim-qt
if exists(':GuiFont')
  " Use GuiFont! to ignore font errors
  GuiFont Fira\ Code:h11
endif
