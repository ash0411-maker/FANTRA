class AddIntroductionToGuides < ActiveRecord::Migration[5.2]
  def change
    add_column :guides, :selfy_image_id, :string
  end
end
