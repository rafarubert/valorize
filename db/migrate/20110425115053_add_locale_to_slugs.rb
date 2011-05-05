class AddLocaleToSlugs < ActiveRecord::Migration
  def self.up
    add_column :slugs, :locale, :string

    add_index :slugs, :locale
  end

  def self.down
    remove_index :slugs, :locale
    remove_column :slugs, :locale
  end
end
