class UserMailer < ApplicationMailer
  def notify_winner(user, guess)
    mail(to: user.email,
         subject: "#{user.name} you won!",
         body: "Your guess was #{guess.distance_to_target} meters away from the target")
  end
end
