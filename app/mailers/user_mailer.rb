class UserMailer < ApplicationMailer
    def digests(user, stakeholder_updates)
        @stakeholder_updates = stakeholder_updates
        @name = user.first_name
        # link to each of them, including the founder's contact details
        mail(to: user.email, subject: 'Your founder digests are here')
    end
end
