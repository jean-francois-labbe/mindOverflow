atom_feed do |feed|
  feed.title("My great blog!")
  feed.updated(@articles[0].created_at) if @articles.length > 0
  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title(article.title)
      entry.content(article.body, :type => 'html')
      
      entry.author do |author|
        author.name("DHH")
      end
    end
  end
end
