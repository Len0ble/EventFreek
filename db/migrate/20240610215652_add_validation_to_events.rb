class AddValidationToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :validated, :boolean
    add_column :events, :reviewed, :boolean
  end
end
