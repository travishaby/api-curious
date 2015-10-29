class UsersController < ApplicationController
  def update
    @address = Address.new(address_params) #creating address updates user object
    if @address.save
      current_user.address = @address
      @address.convert_to_lat_long_for_user
      create_legislators
      redirect_to root_path
    else
      render "welcome/index"
    end
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end
end
