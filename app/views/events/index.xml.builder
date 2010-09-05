xml.instruct!
xml.rss "version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/" do
 xml.channel do
   xml.title       "Lyonrb Events"
   xml.link        root_url
   xml.description I18n.t('.lyonrb.title')

   @events.each do |event|
     xml.item do
       xml.title       event.name
       xml.place_name  event.place_name
       xml.address     event.address
       xml.start_at    event.start_at
     end
   end
 end
end