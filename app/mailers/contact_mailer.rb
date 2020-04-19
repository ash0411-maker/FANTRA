class ContactMailer < ApplicationMailer

	def send_when_admin_reply(contact, admin_text) #メソッドに対して引数を設定
	    @user = contact #ユーザー情報
	    @answer = admin_text #返信内容
	    mail to: contact.email, subject: '【サイト名】 お問い合わせありがとうございます'
  	end

end
