class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth']
    puts '--------'
    pp auth
    # Find an identity here
    @identity = Identity.find_with_omniauth(auth)

    if @identity.nil?
      # If no identity was found, create a brand new one here
      @identity = Identity.create_with_omniauth(auth)
    end

    if user_signed_in?
      if @identity.user == current_user
        # User is signed in so they are trying to link an identity with their
        # account. But we found the identity and the user associated with it
        # is the current user. So the identity is already associated with
        # this user. So let's display an error message.
        redirect_to root_url, notice: t('.already')
      else
        # The identity is not associated with the current_user so lets
        # associate the identity
        @identity.user = current_user
        @identity.save
        redirect_to root_url, notice: t('.connected')
      end
    else
      if @identity.user.present?
        # The identity we found had a user associated with it so let's
        # just log them in here
        session[:user_id] = @identity.user.id
        redirect_to root_url, notice: t('.signed')
      else
        # No user associated with the identity so we need to create a new one
        redirect_to new_user_url, notice: t('.continue')
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: t('.signed_out')
  end
end
