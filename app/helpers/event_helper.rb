module EventHelper
  
  def event_map_url(event)
    event = Event.new if event.nil?
    gmaps_url + {
      :center => 'Lyon,France',
      :zoom => 14,
      :size => '300x140',
      :maptype => 'roadmap',
      :markers => "color:red|#{event.address}",
      :sensor => false
    }.to_query
  end
  
  def gmaps_url
    'http://maps.google.com/maps/api/staticmap?'
  end
end
