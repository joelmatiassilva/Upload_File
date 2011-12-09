class AddDetailsToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :detalle, :string
  end

  def up
   add_column :uploads, :detalle, :string
  end
end
