xml.feed do |feed|
  feed.title = "Quotel"
  @feeds.each do |quote|
    feed.entry do |entry|
      if quote.author.present?
        entry.title quote.author
      else
        entry.title "Anonymous"
      end
        entry.content quote.description
        entry.url root_url
    end
  end
end

 