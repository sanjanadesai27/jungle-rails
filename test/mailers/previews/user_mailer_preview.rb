class UserMailerPreview < ActionMailer::Preview
  def order_receipt 
    UserMailer.order_receipt(Order.first)
  end
end