module DirectMeWisely

  def direct_me_wisely
    if @canva.save && valid_photo?
      redirect_to canva_path(@canva, room_choice: @svg)
    else
      flash[:notice] = "Please select a valid picture"
      redirect_to new_canva_path(room_choice: @svg)
    end
  end


end
