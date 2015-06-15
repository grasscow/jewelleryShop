module ApplicationHelper
  def alert_class_for(flash_type)
    {
        success: 'alert-success',
        error:   'alert-danger',
        alert:   'alert-warning',
        notice:  'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
  def number_to_currency_br(number)
    number_to_currency(number, :unit => "$", :separator => ",", :delimiter => ".")
  end
end
