require 'docsplit'

class Upload < ActiveRecord::Base
  attr_accessible :detalle, :resume
  mount_uploader :resume, ResumeUploader
  before_save :crear_archivo_text
  after_save :guardar_contenido_text_en_tabla

  def crear_archivo_text
   cad = "" 
   self.detalle = ""
   Docsplit.extract_text("/home/joel/Escritorio/Upload_File/public"+resume.to_s, :output=>'public/archivos')
  # debugger
    #File.open("/home/joel/Escritorio/Upload_File/public"+resume.to_s.gsub(".pdf",".txt"), 'r') do |f1|
      #debugger

     # while linea = f1.gets
    #	cad = cad + linea
    # end
    #end
    #debugger
   # self.detalle = cad
    #debugger
    #File.open('joe.txt', 'w') do |f2|
     #f2.puts cad
    #end
  end

  def guardar_contenido_text_en_tabla
	cadena = ""
	self.detalle =""
    	File.open("/home/joel/Escritorio/Upload_File/public"+resume.to_s.gsub(".pdf", ".txt"), 'r') do |f1|
   		while lineaArchivo = f1.gets
	 	 cadena = cadena + lineaArchivo
 		end
	end
	debugger
	self.detalle = cadena
	debugger
  end
 

end
