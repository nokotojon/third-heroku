class CreateComents < ActiveRecord::Migration[5.2]
  def change
    create_table :coments do |t|
      t.integer :user_id
      t.integer :topic_id
      t.string  :discription

      t.timestamps
    end
  end
end
