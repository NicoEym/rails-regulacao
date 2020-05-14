  # This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


ArticleTopic.delete_all
Topic.delete_all
Article.delete_all
Governance.delete_all

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filesarticles    = 'db/csv_repos/CVM.csv'

CSV.foreach(filesarticles, csv_options) do |row|

  if Governance.where(title: row['title']).empty?
    Governance.create(title: row['title'])
    puts "Creating #{row['title']}"
    puts "#{Governance.find_by(title: row['title'])}"
  end

  governance_id = Governance.find_by(title: row['title']).id

  article = Article.create(governance_id: governance_id, chapter: row['chapter'], section: row['section'], details: row['details'], number: row['number'] )
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






