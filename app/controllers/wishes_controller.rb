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
      flash[:error] = @wish.errors.full_messages.join(' ')
      render :new
    end
  end

  def edit
    @wish = Wish.find(params[:id])
  end

  def update
    @wish = current_user.wishes.find(params[:id])

    if @wish.present? && @wish.status == 'pending' && @wish.update(wish_params)
      flash[:success] = t('wish.update_success')
      redirect_to new_wish_path
    else
      flash[:error] = t('wish.create_failed')
      render :edit
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:description)
  end
end
