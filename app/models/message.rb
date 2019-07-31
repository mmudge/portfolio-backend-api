class Message < ApplicationRecord
    belongs_to :user


    def unread?
        state == 'unread'
    end

    def read?
        state == "read"
    end
end
