class Relatorio < ActiveRecord::Base
  attr_accessible :arquivo, :user_id
  has_attached_file :arquivo, styles: {thumb: '100x100#'},
    url: "/assets/relatorios/:id/:style/:basename.:extension",
    path: ":rails_root/public/assets/relatorios/:id/:style/:basename.:extension",
    :styles => {
    :pdf_thumbnail => ["100x100", :jpg]}

  validates_attachment_presence :arquivo
  validates_attachment_size :arquivo, less_than: 20.megabytes
  validates_attachment_content_type :arquivo, content_type: ['application/pdf']

  scope :por_usuario, lambda {|user_id| where(user_id: user_id)}

  belongs_to :user

  def self.search(search,user_id)
    if search
      find(:all, conditions: ['title LIKE ?', "%#{search}%"])
    else
      por_usuario(user_id)
    end
  end

end
