atom_feed :language => 'en-US' do |feed|
  feed.title "Quotel"
  feed.updated Time.now

  @feeds.each do |item|

    feed.entry( item ) do |entry|
      entry.url welcome_index_url
      entry.title "Quote"
      entry.content item.description, :type => 'html'
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
      entry.author "Anonymous"
    end
  end
end

 