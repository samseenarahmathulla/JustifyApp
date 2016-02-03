class RenamePhoneToPhoneOfFirmInLawfirmsTable < ActiveRecord::Migration
  def change
    rename_column :lawfirms, :phone, :phone_of_firm
  end
end
