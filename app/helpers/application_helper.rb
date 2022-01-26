module ApplicationHelper
	def flash_class(type)
		return {notice:"primary",error:"danger",warning:"warning"}[type]
	end
end
