module SalesHelper
  def active_sale?
    Sale.active.any?
  end

  def current_sale
    if active_sale?
      @current_sale = Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).first
    end
  
  end
end