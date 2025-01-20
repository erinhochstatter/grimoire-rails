class SessionsController < ApplicationController
  # POST /sessions
  def create
    sgid = params.require(:sgid)

    friend = GlobalID::Locator.locate_signed(sgid, for: 'login')

    sign_in(friend) if !friend.nil? || friend.is_a?(Friend)
    redirect_to root_path
  end

  # PATCH/PUT /sessions/1
  def update
    if @session.update(session_params)
      render json: @session
    else
      render json: @session.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sessions/1
  def destroy
    # lookup by token
    @session.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def session_params
    params.fetch(:session, {})
  end
end
