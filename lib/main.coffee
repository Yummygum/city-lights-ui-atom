root = document.documentElement
tabsInTreeView = root.querySelector '.list-inline.tab-bar.inset-panel'
treeViewTitles = document.querySelectorAll('.tree-view span.name')

module.exports =
  activate: (state) ->
    atom.config.observe 'city-lights-ui.showTabsInTreeView', (newValue) ->
      showTabBarInTreeView(newValue)

    atom.config.observe 'city-lights-ui.fontSize', (newValue) ->
      setSize(newValue)

  deactivate: ->
    unsetSize()


showTabBarInTreeView = (boolean) ->
  if boolean
    tabsInTreeView.style.display = 'flex'
  else
    tabsInTreeView.style.display = 'none'


setSize = (currentFontSize) ->
  for span, i in treeViewTitles
    span.style.fontSize = currentFontSize + 'px'
    if currentFontSize >= 13
      span.style.lineHeight = 2.4
    else
      span.style.lineHeight = 2.1

unsetSize = () ->
  for span, i in treeViewTitles
    span.style.fontSize = ''
