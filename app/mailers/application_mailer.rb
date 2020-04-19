class ApplicationMailer < ActionMailer::Base

	# 問い合わせ内容がここのアドレスから送られてくる。
	default from:    "管理人 <from@example.com>"
  	layout 'mailer'

end

