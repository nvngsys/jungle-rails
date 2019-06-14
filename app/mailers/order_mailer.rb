class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def thankyou_email(order)
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @order.email, subject: 'Welcome to My Awesome Site')
  end
end
