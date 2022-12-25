class UserSubmissionMailer < ApplicationMailer
    # define a method for each mail we send 
    def reject(user_submission)
        @name = user_submission.name
        mail(to: user_submission, subject: "Sorry, you were rejected")
    end

    def accept(user_submission, created_user, temp_password)
        @name = user_submission.name
        @email = user_submission.email
        @auth_code = created_user.auth_code
        @temp_password = temp_password
        
        mail(to: user_submission, subject: "Congrats, you were accepted!")
    end

end
