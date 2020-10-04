##
# Pagination provide methods to controller for paginate records
##
module Pagination
  def paginated(data)
    data_to_display = data.page(params[:page] ? params[:page].to_i : 1)            
    { data: data_to_display, meta: pagination_meta(data_to_display) }
  end

  def pagination_meta(data)        
    {        
      current_page: data.current_page,        
      next_page: data.next_page,        
      prev_page: data.prev_page,        
      total_pages: data.total_pages,        
      total_count: data.total_count
    }    
  end
end