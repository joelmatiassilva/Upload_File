class Upload < ActiveRecord::Base
  mount_uploader :resume, ResumeUploader
end
