class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :index => { :unique => true }
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
    end

    reversible do |dir|
      dir.up do
        execute "CREATE UNIQUE INDEX index_users_on_lower_email ON users (lower(email));"
      end

      dir.down do
        execute "DROP INDEX index_users_on_lower_email;"
      end
    end
  end
end
