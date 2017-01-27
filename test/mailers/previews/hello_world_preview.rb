# Preview all emails at http://localhost:3000/rails/mailers/hello_world
class HelloWorldPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hello_world/hello
  def hello
    HelloWorld.hello
  end

end
