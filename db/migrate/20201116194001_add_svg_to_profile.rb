class AddSvgToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :svg, :text
  end
end
