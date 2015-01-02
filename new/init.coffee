# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to make opened Markdown files always be soft wrapped:
#
# path = require 'path'
#
# atom.workspaceView.eachEditorView (editorView) ->
#   editor = editorView.getEditor()
#   if path.extname(editor.getPath()) is '.md'
#     editor.setSoftWrap(true)
fs = require 'fs'
path = require 'path'

require './bgswitcher'

window.toggleNativeUI = (e) ->
  e = e || {}
  atom.commands.dispatch(document.body, 'window:toggle-full-screen', e)
  atom.commands.dispatch(document.body, 'window:toggle-menu-bar', e)
  console.log 'native UI switched.'

# pseudo-code
atom.commands.add 'atom-workspace',
 'window:toggle-all-ui', (e) =>
    e.abortKeyBinding()
    toggleNativeUI(e)

atom.commands.add 'atom-workspace',
  'window:close-active-pane': (e) =>
    e.abortKeyBinding()
    atom.workspace.getActivePane().close()
  'window:next-background': (e) =>
    $("body").bgSwitcher('next')
  'window:prev-background': (e) =>
    $("body").bgSwitcher('prev')

atom.menu.add [
  { label: '&View', submenu: [{ label: 'Hide All UI Bars', command:'window:toggle-all-ui' }] }
  { label: 'Packages', submenu: [{ label: 'Backgrounds', submenu: [ { label: 'Next BG', command: 'window:next-background' }, { label: 'Previous BG', command: 'window:prev-background' }  ] }]}
]
