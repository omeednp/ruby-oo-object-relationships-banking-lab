class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize (sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status = "pending"
  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def funds_check(person, value)
    person.balance >= value
  end
    
  def execute_transaction
    if @status == "pending"
      if funds_check(@sender,@amount) && @sender.valid? && @receiver.valid?
        sender.balance -= @amount
        receiver.balance += @amount
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def switch_accounts
    account_holder1 = @sender
    account_holder2 = @receiver
    @sender = account_holder2
    @receiver = account_holder1
  end


  def reverse_transfer
    if @status == "complete"
      switch_accounts
      @status ="pending"
      execute_transaction
      @status = "reversed"
    end
  end


end
