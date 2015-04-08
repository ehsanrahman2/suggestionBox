class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.text :idea_description
      t.text :idea_benefit
      t.integer :priority, default:0
      t.integer :idea_status, default:0
      t.string :email
      t.string :supervisor_email

      t.timestamps
    end
  end
end
