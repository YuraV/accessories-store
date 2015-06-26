module CustomerService
  class Creator
    attr_accessor :customer, :cookies
    delegate :save, :email, to: :customer

    def self.create!(attributes, cookies)
      new(attributes, cookies).create!
    end

    def initialize(attributes, cookies)
      @customer   = Customer.new(attributes)
      @cookies    = cookies
    end

    def create!
      save
      cookies[:user_data] = { value: { email: email }.to_json } if save
      customer
    end
  end
end
