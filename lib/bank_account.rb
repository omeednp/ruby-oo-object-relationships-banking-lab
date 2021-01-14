class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    @@all =[]
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    #def update_balance(value)
       # @balance 
    def deposit(value)
        @balance+=value
    end
    
    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        self.balance >0 and self.status != "closed"
    end

    def close_account
        self.status = "closed"
    end

    

end
