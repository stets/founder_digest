class UserSubmission < ApplicationRecord
    include RandomStringable

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
        temp_password = generate_random_string
        created_user = User.create!(email: self.email, password: temp_password, first_name: self.first_name, last_name: self.last_name, plan_name: self.plan_name)
        created_user.projects.create!(website: self.website)
        UserSubmissionMailer.accept(self, created_user, temp_password).deliver
    end

end


