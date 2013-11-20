class Relatorio < ActiveRecord::Base
  attr_accessible :arquivo, :user_id
  has_attached_file :arquivo

  belongs_to :user

end
