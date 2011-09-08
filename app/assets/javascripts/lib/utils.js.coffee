@Utils =
  loadTemplates: (compiler) =>
    templates = {}
    $('*[type="text/x-js-template"]').map( ->
      name = $(this).attr('name')
      source = $(this).html().replace('&gt;', '>').trim()
      templates[name] = if compiler then compiler(source) else source
    )
    templates
