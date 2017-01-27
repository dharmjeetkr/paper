class HelloController < ApplicationController
  
  def show
     
   HelloWorld.hello.deliver_now  #use hello controller to send mail 
                                 #by calling mailer classname.method.deliver

  end
end
