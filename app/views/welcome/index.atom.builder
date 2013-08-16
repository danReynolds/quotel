xml.feed do |xml|
  feed.title = "Quotel"
end
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
 