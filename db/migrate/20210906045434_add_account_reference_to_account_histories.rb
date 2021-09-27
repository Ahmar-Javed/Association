class AddAccountReferenceToAccountHistories < ActiveRecord::Migration[6.1]
  def change
    add_reference :account_histories, :account, null: false, foreign_key: true
  end
end
