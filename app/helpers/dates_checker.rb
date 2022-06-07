require 'date'

class DatesChecker
  def initialize(date_from:, date_to:)
    @date_from = Date.parse(date_from)
    @date_to = Date.parse(date_to)
  end

  def check
    return false if @date_from == '' || @date_to == ''
    both_dates_in_the_future && date_to_after_date_from
  end

  private

  def both_dates_in_the_future
    @date_from > DateTime.now && 
    @date_to > DateTime.now
  end

  def date_to_after_date_from
    @date_to > @date_from
  end
end
