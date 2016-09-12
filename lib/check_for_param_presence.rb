module CheckForParamPresence

  def check_for_param_presence
    if params[:canva].present?
      @canva.update(canva_params)
    else
      flash[:notice] = "Please select a valid picture"
    end
  end

end
