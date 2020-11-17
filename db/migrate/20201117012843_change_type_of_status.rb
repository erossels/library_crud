class ChangeTypeOfStatus < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      change_table :books do |t|
          dir.up { t.change :status, :integer}
          dir.down { t.change :status, :string}
      end
    end
  end
end
