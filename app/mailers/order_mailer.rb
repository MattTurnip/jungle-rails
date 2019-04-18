class OrderMailer < ApplicationMailer
  default from: "admin@jungle.com"
  
  def order_confirm_email(order)
    @order = order
    mail(to: "@order.email", subject: 'Welcome to My Awesome Site')
  
  end
end

#eventually we'd add dynamic email with current_user.email, but I just want to hardcode it first