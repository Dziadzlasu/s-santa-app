class WishesController < ApplicationController
  def new
    @wish = Wish.new
    @current_wish = current_user.wish_to_fulfill
  end

  def create
    @wish = current_user.wishes.new(wish_params)
    if @wish.valid? && @wish.save!
      flash[:success] = t('wish.create_success')
      redirect_to new_wish_path
    else
      flash[:error] = t('wish.create_failed')
      render :new
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:description)
  end
end
