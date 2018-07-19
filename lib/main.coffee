root = document.documentElement
tabsInTreeView = root.querySelector '.list-inline.tab-bar.inset-panel'
treeViewTitles = document.querySelectorAll('.tree-view span.name')

module.exports =
  activate: (state) ->
    console.log 'activate city lights ui ', state

    tabSizeValue = atom.config.get('city-lights-ui.tabSize')
    fontSizeValue = atom.config.get('city-lights-ui.fontSize')
    setSize(fontSizeValue)
    changeTabBarSize(tabSizeValue)

    atom.config.observe 'city-lights-ui.showTabsInTreeView', (newValue) ->
      showTabBarInTreeView(newValue)

    atom.config.observe 'city-lights-ui.fontSize', (newValue) ->
      setSize(newValue)

    atom.config.observe 'city-lights-ui.tabSize', (tabSizeValue) ->
      changeTabBarSize(tabSizeValue)

  deactivate: ->
    unsetSize()


showTabBarInTreeView = (boolean) ->
  if boolean
    tabsInTreeView.style.display = 'flex'
  else
    tabsInTreeView.style.display = 'none'


setSize = (currentFontSize) ->
  root.style.fontSize = currentFontSize + 'px'
  if currentFontSize >= 11
    root.style.lineHeight = 2.4
  else
    root.style.lineHeight = 2.1

unsetSize = () ->
  for span, i in treeViewTitles
    span.style.fontSize = ''

changeTabBarSize = (tabValue) ->
  tabBars = document.querySelectorAll('.tab-bar .tab')
  switch tabValue
    when 'small'
      for tab in tabBars
        tab.classList.add(tabValue)
        tab.classList.remove('medium')
        tab.classList.remove('large')

    when 'medium'
      for tab in tabBars
        tab.classList.add(tabValue)
        tab.classList.remove('large')
        tab.classList.remove('small')

    when 'large'
      for tab in tabBars
        tab.classList.add(tabValue)
        tab.classList.remove('medium')
        tab.classList.remove('small')

observeEditorsOnEvents = ->
  tabSizeValue = atom.config.get('city-lights-ui.tabSize')
  fontSizeValue = atom.config.get('city-lights-ui.fontSize')
  setSize(fontSizeValue)
  changeTabBarSize(tabSizeValue)

atom.workspace.observeActivePaneItem (editor) ->
  observeEditorsOnEvents()

atom.workspace.observeTextEditors (editor) ->
  observeEditorsOnEvents()
