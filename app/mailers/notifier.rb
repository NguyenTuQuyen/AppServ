class Notifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  default from: 'vicedocthan@gmail.com'

  def order_received(order)
    @order = order
    @url  = 'http://www.gmail.com'
    mail to: @user.email, subject: "Sample Email"
  end
end
