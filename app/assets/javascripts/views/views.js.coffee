Lyonrb.MapView = SC.View.extend
  map: null
  center: new google.maps.LatLng(45.766944, 4.834167)
  zoom: 13
  didCreateMap: null
  render: (ctx, first) -> ctx.push('<div id="gmap"></div>') if first
  didCreateLayer: () -> this.invokeLast('_createMap')
  _createMap: () ->
    if this._map
      google.maps.event.trigger(this._map, 'resize')
    else
      opts =
        zoom: this.get('zoom')
        center: this.get('center')
        mapTypeId: google.maps.MapTypeId.ROADMAP
      div = this.$('div')[0]
      map = new google.maps.Map(div, opts)
      this._map = map
      this.set('map', map)
      this.didCreateMap(map) if(this.didCreateMap)
