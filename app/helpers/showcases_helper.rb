module ShowcasesHelper
	
	def thumbnail_tag(image)
		image_tag "/system/photos/#{image.id}/small/#{image.photo_file_name}" if image
	end
	
end
