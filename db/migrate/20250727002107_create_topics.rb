class CreateTopics < ActiveRecord::Migration[8.0]
  def change
    create_table :topics do |t|
      t.string :topic_title #the topic title (ex: SQL, Data Modeling)
      
      t.timestamps
    end
  end
end
