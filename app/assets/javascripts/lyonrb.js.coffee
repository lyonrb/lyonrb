@Lyonrb = SC.Application.create
  NAMESPACE: 'Lyonrb'
  main: () ->
    $.extend(SC.TEMPLATES, Utils.loadTemplates(SC.Handlebars.compile))
    Lyonrb.mainPane = SC.TemplatePane.append
      layerId: 'lyonrb'
      templateName: 'lyonrb'
  store: SC.Store.create({}).from('Lyonrb.DataSource')

SC.ready(() -> Lyonrb.main())

