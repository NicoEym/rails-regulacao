# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

Governance.delete_all
Topic.delete_all
Article.delete_all

def seed_governance(governance_array)

  governance_array.each do |level|
    Governance.create(title: governance)
    puts "Creating #{governance}"
  end
end

def seed_topic(topic_array)

  topic_array.each do |topic|
    Topic.create(name: topic)
    puts "Creating #{topic}"
  end
end


governance_seed = ["CVM", "Anbima"]

seed_level(level_seed)




csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filesarticles    = 'db/csv_repos/CVM.csv'

CSV.foreach(filesarticles, csv_options) do |row|

  if Governance.where(title: row['title']).empty?
    Governance.create(title: row['title'])
    puts "Creating #{row['title']}"
    puts "#{Governance.find_by(title: row['title'])}"

  end

  governance_id = Governance.find_by(name: row['title']).id

  Article.create(title: governance_id, chapter: row['chapter'], section: row['section'], details: row['details'], number: row['number'] )
  puts "Creating #{row['governance']} - #{row['chapter']} - #{row['section']}"

  topics = row['topics'].split("/")
  topics.each do |topic|
    Topic.create(name: topic) if Topic.where(name: topic).empty?
    topic_id = Topic.find_by(name: topic).id
    article_id = Article.find_by(chapter: row['chapter'], section: row['section'], number: row['number']).id
    Article_topic.create(article_id: article_id, topic_id: topic_id)
  end

end






