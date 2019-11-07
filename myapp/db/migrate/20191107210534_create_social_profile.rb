class CreateSocialProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :social_profiles do |t|
      t.references :user
      t.string :provider, null: false, default: ""
      t.string :uid,      null: false, default: ""
      t.string :name
      t.timestamps null: false
    end
    add_index :social_profiles, [:provider, :uid], unique: true
  end
end
