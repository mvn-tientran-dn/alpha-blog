CKEDITOR.editorConfig = (config) ->
  config.toolbar_mini = [ [
    'Bold'
    'Italic'
    'Underline'
    'TextColor'
    'BGColor'
    'Link'
    'Unlink'
  ] ]
  config.removeDialogTabs = 'link:advanced;link:target';
  config.toolbar = 'mini'
  config.allowedContent = true
  config.fillEmptyBlocks = false
  config.autoParagraph = false
  config.enterMode = CKEDITOR.ENTER_BR
  config.removePlugins = 'elementspath'
  config.contentsCss = ['body {font-size: 14px; margin: 18px;}']
  return
