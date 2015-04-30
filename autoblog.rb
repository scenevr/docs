require 'json'
require 'open-uri'
require 'date'
require 'htmlentities'

json = JSON.parse(open('http://reddit.com/r/scenevr.json').readlines.join)

json['data']['children'].each do |child|
  child = child['data']

  next unless child['selftext_html']
  next unless child['author'] == 'captainbenis'

  date = DateTime.strptime(child['created'].to_s,'%s').strftime('%Y-%m-%d')
  title = child['title']

  slug = date + '-' + title.downcase.gsub(/[^a-z]+/,'-').slice(0,50).sub(/^-+/,'').sub(/-+$/,'') + '.md'

  html = HTMLEntities.new.decode(child['selftext_html'])
  html = html.gsub(/<!--.+?-->/,'')
  html += "<br /><a href='#{child['url']}'>Read comments on reddit...</a>"

  post = "---\ntitle: #{title}\ndate: #{date}\nlayout: post\n---\n" + html

  next if File.exists?('source/posts/' + slug)

  File.open('source/posts/' + slug, 'w') { |f| f.write(post) }
end

