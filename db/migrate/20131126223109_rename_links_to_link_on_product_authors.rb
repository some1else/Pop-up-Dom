class RenameLinksToLinkOnProductAuthors < ActiveRecord::Migration
  def change
    rename_column :product_authors, :links, :link
  end
end
