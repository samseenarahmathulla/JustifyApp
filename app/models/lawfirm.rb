class Lawfirm < ActiveRecord::Base
  belongs_to :user
  has_many :lawyers
end
