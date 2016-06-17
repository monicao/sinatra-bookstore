class CreateUsers < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :is_admin, default: false
    end
  end
  
end
