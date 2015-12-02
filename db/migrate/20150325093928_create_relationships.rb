class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.integer :user1_id
    	t.integer :user2_id
      t.integer :relation, default: 0

      t.timestamps
    end
  end
end
