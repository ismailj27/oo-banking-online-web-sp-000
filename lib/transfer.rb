class Transfer
  attr_accessor :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def status
    @status
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @sender.balance < 0 && @status == "pending"
      binding.pry
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    elsif @sender.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = "reversed"
    end
  end
  
  
end
