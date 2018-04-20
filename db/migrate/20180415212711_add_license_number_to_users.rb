class AddLicenseNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :license_number, :integer
  end
end
