class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.string :profile_image
      t.string :provider

      t.timestamps
    end
  end
end
