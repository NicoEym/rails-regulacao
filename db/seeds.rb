

require 'csv'
require 'rubygems'
require 'algoliasearch'



ArticleTopic.delete_all
Topic.delete_all
Topic.clear_index!
Article.delete_all
Article.clear_index!
Governance.delete_all

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filesarticles    = 'db/csv_repos/data.csv'

CSV.foreach(filesarticles, csv_options) do |row|

  if Governance.where(title: row['title']).empty?
    Governance.create(title: row['title'], photo_url: row['photo_url'])
    puts "Creating #{row['title']}"
    puts "#{Governance.find_by(title: row['title'])}"
  end

  governance_id = Governance.find_by(title: row['title']).id

  article = Article.create(governance_id: governance_id, chapter: row['chapter'], section: row['section'], details: row['details'], details_algolia: row['detailsAlgolia'], number: row['number'], topic_string: row['topics'] )
  puts "Creating Article #{row['number']} in #{row['governance']} - #{row['chapter']} - #{row['section']}"



  topics = row['topics'].split("/")
  topics.each do |topic|
    Topic.create(name: topic) if Topic.where(name: topic).empty?
    topic_id = Topic.find_by(name: topic).id
    puts "Creating Topic #{topic}"
    ArticleTopic.create(article_id: article.id, topic_id: topic_id)
    puts "Creating jointure article with topic #{topic}"
  end



end


# client = Algolia::Client.new(application_id: ENV['ALGOLIASEARCH_APPLICATION_ID'], api_key: ENV['ALGOLIASEARCH_ADMIN_API_KEY'])
# index = client.init_index('prod_TOPIC')


# topics =Topic.all
# topics_array = []
# topics.each do |topic|
#   topics_hash = {name: topic.name, id: topic.id, artigos: topic.articles.count }
#   topics_array << topics_hash
# end
# index.add_objects(topics_array)

# index = client.init_index('prod_ARTICLE')


# articles =Article.all
# articles_array = []
# articles.each do |article|
#   topics_string = ""
#   article.topics.each do |topic|
#     topics_string = topics_string + topic.name + " "
#   end
#   articles_hash = {number: article.number, id: article.id, chapter: article.chapter, section: article.section, details: article.details, governance: article.governance.title, topics: article.topics}
#   articles_array << articles_hash
# end
# index.add_objects(articles_array)




