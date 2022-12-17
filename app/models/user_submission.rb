class UserSubmission < ApplicationRecord
    # constant accessible anywhere as UserSubmission::PLAN_NAME
    PLAN_NAMES = ['pro', 'free']

    validates :plan_name, inclusion: { in: PLAN_NAMES }
    validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text

    # callback!
    after_update :send_mailer

    def name
        "#{first_name} #{last_name}"
    end

    # I'm a callback!
    def send_mailer
        puts "sending mailer!!"
        UserSubmissionMailer.reject(self).deliver if status == 'Reject'
        UserSubmissionMailer.accept(self).deliver if status == 'Accept'
    end
end


