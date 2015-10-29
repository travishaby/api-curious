class UsersController < ApplicationController
  def update
    @address = Address.new(address_params) #creating address updates user object
    if @address.save
      current_user.address = @address
      @address.convert_to_lat_long_for_user
      create_legislators
      flash[:success] = "Your address was successfully updated!"
    else
      flash[:error] = "Your address was not updated. Please try again."
    end
    redirect_to root_path
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip_code)
  end
end
