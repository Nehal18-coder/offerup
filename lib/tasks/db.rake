namespace :db do
  desc "Erase all tables"
  task clear: :environment do
    connection = ActiveRecord::Base.connection
    tables = connection.tables
    tables.each do |table|
      puts "Deleting #{table}"
      connection.drop_table(table, force: :cascade)
    rescue StandardError => e
      puts e.message
    end
  end
end
