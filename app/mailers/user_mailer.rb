class UserMailer < ApplicationMailer
 def order_receipt(order) 
    # where do i get this user from?
    @order = order
    # @url = order_path
    mail(to: @order.email, subject: "Your receipt for Order #{@order.id}")
  end

end
