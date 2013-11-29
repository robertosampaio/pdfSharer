class Relatorio < ActiveRecord::Base
  attr_accessible :arquivo, :user_id
  has_attached_file :arquivo,
    url: "/assets/relatorios/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/relatorios/:id/:style/:basename.:extension",
    :styles => {
    :pdf_thumbnail => ["100x100", :jpg]}

  validates_attachment_presence :arquivo
  validates_attachment_size :arquivo, less_than: 20.megabytes
  validates_attachment_content_type :arquivo, content_type: ['application/pdf']

  belongs_to :user

end
