class CreateAffirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :affirmations do |t|

      t.timestamps
    end
  end
end
