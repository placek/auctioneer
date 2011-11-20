module AdminHelper

  def total_count_of model
    model.all.count
  end

end
