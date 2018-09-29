class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.references :user, foreign_key: true
      t.references :compartilhado, foreign_key: true

      t.timestamps
    end
  end
end
