class CreateActiveStoragePostgresqlTables < ActiveRecord::Migration[5.2]
  def change
    create_table :active_storage_postgresql_files do |t|
      t.oid :oid
      t.string :key

      t.index :key, unique: true
    end
  end
end
