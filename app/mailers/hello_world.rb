class HelloWorld < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hello_world.hello.subject
  #
  def hello
    @greeting = "Hi how r you"

    mail to: "dharmjeetkr18@gmail.com"      #"to@example.org"
  end
end
