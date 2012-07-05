class Departments < ActiveRecord::Base
  attr_accessible :dept_email, :dept_fax, :dept_hours, :dept_location, :dept_mailing, :dept_name, :dept_phone, :pic_content_type, :pic_file_name, :pic_file_size
end
