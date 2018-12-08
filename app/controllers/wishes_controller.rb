class WishesController < ApplicationController
  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
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
