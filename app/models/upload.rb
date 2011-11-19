require 'docsplit'

class Upload < ActiveRecord::Base
  attr_accessible :detalle, :resume
  mount_uploader :resume, ResumeUploader
  before_save :update_asset_attributes

  def update_asset_attributes
   cad = "" 
   self.detalle = ""
   debugger
   Docsplit.extract_text("/home/joel/Escritorio/Upload_File/public"+resume.to_s, :output=>'public/archivos')
  # File.open("/home/joel/Escritorio/upload_joel/public"+resume.to_s, 'r') do |f1|
   #  while linea = f1.gets
    #	cad = cad + linea
     #end
    #end
    #debugger
    #self.detalle = cad
    #debugger
    #File.open('joe.txt', 'w') do |f2|
     #f2.puts cad
    #end

  end

end
