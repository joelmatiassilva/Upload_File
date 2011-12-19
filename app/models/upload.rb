require 'docsplit'

class Upload < ActiveRecord::Base
  attr_accessible :resume, :ruta
  mount_uploader :resume, ResumeUploader
  before_save :crear_archivo_text
  before_create :guardar_contenido_text_en_tabla
  after_save :despues_de_salvar

  def despues_de_salvar
   	debugger	
  end

  def crear_archivo_text
   Docsplit.extract_text("/home/joel/Escritorio/Upload_File/public"+resume.to_s, :output=>'public/archivos')
debugger
end

  def guardar_contenido_text_en_tabla
	cadena = ""
        self.detalle =""
	debugger
    	File.open("/home/joel/Escritorio/Upload_File/public/archivos/"+resume.file.filename.to_s.gsub(".pdf", ".txt"), 'r') do |f1|
   		while lineaArchivo = f1.gets
	 	 cadena = cadena + lineaArchivo
 		end
	end
	self.detalle = cadena
	debugger
  end

#  def guardar_contenido_text_en_tabla
 # end 

end
