module FiltersHelper
  def published_filters
    Filter.published
  end
end
