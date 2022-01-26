user = User.new do |user|
	user.id = 1
	user.username = "moonknight"
	user.first_name = "Emila"
	user.last_name = "Clarke"
	user.email = "tuncaydinler@hotmail.com"
	user.password_digest = "PythonTuncay1"
end

user.save