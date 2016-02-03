class Lawyer < ActiveRecord::Base
  belongs_to :user
  belongs_to :lawfirm
end
