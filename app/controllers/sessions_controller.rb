class SessionsController < ActionController::Base
  def create
    auth = request.env['omniauth.auth']

    # Extraindo informações úteis do omniauth.auth
    user_id = auth['uid']
    user_name = auth['info']['name']
    user_email = auth['info']['email']
    access_token = auth['credentials']['token']

    # Exibindo no terminal para fins de demonstração
    puts "User ID: #{user_id}"
    puts "User Name: #{user_name}"
    puts "User Email: #{user_email}"
    puts "Access Token: #{access_token}"

    # Redirecionando para outra página após autenticação bem-sucedida
    redirect_to root_path
  end
end
