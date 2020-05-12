class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.text :body
      t.date :reminder
      t.string :status

      t.timestamps
    end
  end
end
