class CreateJournalEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :journal_entries do |t|
      t.string :keywords
      t.string :emotion

      t.timestamps
    end
  end
end
