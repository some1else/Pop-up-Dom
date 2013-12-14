class AddImagesToSponsorsAndVendors < ActiveRecord::Migration
  def change
    add_column :sponsors, :file, :string
    add_column :partners, :file, :string
  end
end
