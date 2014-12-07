class CreateSimpleSpamPreventActionHistories < ActiveRecord::Migration
  def change
    create_table :simple_spam_prevent_action_histories do |t|
      t.string :action
      t.string :controller
      t.integer :reference_id
      t.string :reference_type

      t.timestamps
    end
  end
end