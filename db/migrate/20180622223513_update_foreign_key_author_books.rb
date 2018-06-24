class UpdateForeignKeyAuthorBooks < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :author_books, :authors
    add_foreign_key :author_books, :authors, on_delete: :cascade
  end
end
