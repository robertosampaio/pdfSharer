class AddAttachmentArquivoToRelatorios < ActiveRecord::Migration
  def self.up
    change_table :relatorios do |t|
      t.attachment :arquivo
    end
  end

  def self.down
    drop_attached_file :relatorios, :arquivo
  end
end
