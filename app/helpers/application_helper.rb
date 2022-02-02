module ApplicationHelper
	def flash_class(type)
		return {notice:"primary",error:"danger",warning:"warning"}[type]
	end
	def form_params(parent,child)
		child.new_record? ? [parent,child] : child
	end
end
