class AddProfilePhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :profile_photo, :string
  end
end
