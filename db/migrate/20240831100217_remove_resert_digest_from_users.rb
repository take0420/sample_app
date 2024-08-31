class RemoveResertDigestFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :resert_digest, :string
  end
end
