class UserSubmission < ApplicationRecord
    # constant accessible anywhere as UserSubmission::PLAN_NAME
    PLAN_NAMES = ['pro', 'free']

    validates :plan_name, inclusion: { in: PLAN_NAMES }
    validates_presence_of :first_name, :last_name, :email, :website, :job_role, :text


    def name
        "#{first_name} #{last_name}"
    end
end
