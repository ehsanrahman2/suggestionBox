class UserMailer < ApplicationMailer
  default :from =>"no_reply@gmail.com"
  
  def send_email(idea)
    @idea = idea
    mail(:to => [idea.supervisor_email, idea.email], :subject => "Suggestion from " + idea.email)
  end
  
end
