class UserNotifier < ApplicationMailer
  default from: 'donotreply@heroku.com'

  # send a notification mail to the user
  def notification_mail(mail_address,book_title)
    @book_title = book_title
    @mail_address = mail_address
    mail(to: @mail_address, subject: 'Book is available for checkout')

  end
end
