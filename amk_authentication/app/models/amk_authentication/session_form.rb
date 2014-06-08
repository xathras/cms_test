module AmkAuthentication
  class SessionForm
    include ActiveModel::Model
    extend ActiveModel::Naming

    attr_accessor :email , :password

    validates :email , :password, presence: true

    def self.model_name
      ActiveModel::Name.new(self, nil, 'Session')
    end

    def persisted?
      false
    end
  end
end