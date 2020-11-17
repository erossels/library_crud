class CreateBook < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :status
      t.string :lent_to
      t.date :borrowed
      t.date :returned
    end
  end
end
