class SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token, only: :create

  def create
    auth = request.env['omniauth.auth']

    user_id = auth['uid']
    user_name = auth['info']['name']
    user_email = auth['info']['email']
    access_token = auth['credentials']['token']

    # Adicionando os dados à sessão (se necessário)
    session[:user_id] = user_id
    session[:user_name] = user_name
    session[:user_email] = user_email
    session[:access_token] = access_token

    render 'sessions/show_data'
  end
end
