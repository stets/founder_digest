class UserSubmission < ApplicationRecord
    # constant accessible anywhere as UserSubmission::PLAN_NAME
    PLAN_NAMES = ['pro', 'free']

    validates :plan_name, inclusion: { in: PLAN_NAMES }
    validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text

    # callback!
    after_update :finish_processing

    def name
        "#{first_name} #{last_name}"
    end

    # I'm a callback!
    # we don't want too many
    # one call back that does a lot rather than 3-5 callbacks
    def finish_processing
        reject! if status == 'Reject'
        accept! if status == 'Accept'
    end

    def reject!
        UserSubmissionMailer.reject(self).deliver
    end

    def accept!
        password = generate_password
        created_user = User.create!(email: self.email, password: password)
        created_user.projects.create!(website: self.website)
        UserSubmissionMailer.accept(self, created_user).deliver
    end

    def generate_password
        SecureRandom.hex(10)
    end
end


