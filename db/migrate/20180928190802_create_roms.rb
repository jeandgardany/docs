class CreateRoms < ActiveRecord::Migration[5.2]
  def change
    create_table :roms do |t|
      t.string :nome
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
