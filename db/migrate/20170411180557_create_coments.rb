class CreateComents < ActiveRecord::Migration
  def change
    create_table :coments do |t|
      t.string :name
      t.string :email
      t.text :body
      t.references :post, index: true

      t.timestamps
    end
  end
end
