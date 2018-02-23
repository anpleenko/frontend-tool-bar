module.exports =
  deactivate: ->
    @toolBar?.removeItems()

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'frontend-tool-bar'

    @toolBar.addButton
      'icon': 'tab'
      'tooltip': 'List projects'
      'callback': 'pane:close-other-items'
      'iconset': 'mdi'

    if atom.packages.loadedPackages['project-manager']
      @toolBar.addButton
        'icon': 'file-submodule'
        'tooltip': 'List projects'
        'callback': 'project-manager:list-projects'

    if atom.packages.loadedPackages['prettier-atom']
      @toolBar.addButton
        'icon': 'currency-rub'
        'tooltip': 'Go prettier'
        'callback': 'prettier:format'
        'iconset': 'mdi'

    if atom.packages.loadedPackages['git-plus']
      @toolBar.addButton
        'icon' : 'git-plain'
        'callback' : 'git-plus:menu'
        'tooltip' : 'Git plus'
        'iconset' : 'devicon'
      @toolBar.addButton
        'icon' : 'inbox-arrow-down'
        'callback' : 'git-plus:stash-save'
        'tooltip' : 'Git stash save'
        'iconset' : 'mdi'
      @toolBar.addButton
        'icon' : 'inbox-arrow-up'
        'callback' : 'git-plus:stash-apply'
        'tooltip' : 'Git stash apply'
        'iconset' : 'mdi'
      @toolBar.addButton
        'icon' : 'arrow-down-bold'
        'callback' : 'git-plus:pull'
        'tooltip' : 'Git pull'
        'iconset' : 'mdi'
      @toolBar.addButton
        'icon' : 'arrow-up-bold'
        'callback' : 'git-plus:push-set-upstream'
        'tooltip' : 'Git push'
        'iconset' : 'mdi'

    if atom.packages.loadedPackages['markdown-preview']
      @toolBar.addButton
        'icon': 'markdown'
        'callback': 'markdown-preview:toggle'
        'tooltip': 'Markdown Preview'

    if atom.inDevMode()
      @toolBar.addButton
        'icon': 'refresh'
        'callback': 'window:reload'
        'tooltip': 'Reload Window'
        'iconset': 'ion'

      @toolBar.addButton
        'icon': 'bug'
        'callback': 'window:toggle-dev-tools'
        'tooltip': 'Toggle Developer Tools'
