require 'date'

class DatesChecker
  def initialize(date_from:, date_to:)
    @date_from = date_from
    @date_to = date_to
  end

  def check
    both_dates_in_the_future && date_to_after_date_from
  end

  private

  def both_dates_in_the_future
    DateTime.parse(@date_from).future? && DateTime.parse(@date_to).future?
  end

  def date_to_after_date_from
    @date_to > @date_from
  end
end
