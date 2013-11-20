class CreateRelatorios < ActiveRecord::Migration
  def change
    create_table :relatorios do |t|
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
