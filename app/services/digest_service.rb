class DigestService
    attr_reader :user

    def self.perform
        # below is a scope call
        # User.subscribed.each do |user|
        #     # new will invoke initializer.
        #     new(user).call
        # end
        # same as above
        User.subscribed.each {|u| new(u).call }
    end
    
    def initialize(user)
        @user = user
    end

    def call
        return unless wrote_recent_update?

        UserMailer.digests(user, stakeholder_updates).deliver
    end

    def wrote_recent_update?
        # if user subscription  = pro
        if user.pro_plan?
            user.stake_holder_updates.this_quarter.confirmed > 0 
        else 
            user.stake_holder_updates.this_month.confirmed > 0 
        end
    end

    def stakeholder_updates
        user.subscribers.map(&:project).map(&:latest_stakeholder_update)
    end

end
