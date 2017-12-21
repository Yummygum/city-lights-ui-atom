root = document.documentElement
tabsInTreeView = root.querySelector '.list-inline.tab-bar.inset-panel'

module.exports =
  activate: (state) ->
    atom.config.observe 'city-lights-ui.showTabsInTreeView', (newValue) ->
      showTabBarInTreeView(newValue)

showTabBarInTreeView = (boolean) ->
  if boolean
    tabsInTreeView.style.display = 'flex'
  else
    tabsInTreeView.style.display = 'none'
