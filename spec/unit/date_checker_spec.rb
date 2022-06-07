require 'require_all'
require_all 'app/helpers'
require 'date'

RSpec.describe DatesChecker do
  context 'When both dates are in the future and date_to is after date_from' do
    it 'should return true' do
      dates = DatesChecker.new(
        date_from: (Date.today + 30).to_s,
        date_to: (Date.today + 60).to_s
      )
      expect(dates.check).to be true
    end
  end
  context 'When both dates are in the future BUT date_to is before date_from' do
    it 'should return true' do
      dates = DatesChecker.new(
        date_from: (Date.today + 30).to_s,
        date_to: (Date.today + 10).to_s
      )
      expect(dates.check).to be false
    end
  end
  context 'When date_to is after date_from but date_from is in the past' do
    it 'should return false' do
      dates = DatesChecker.new(
        date_from: (Date.today - 30).to_s,
        date_to: (Date.today + 60).to_s
      )
      expect(dates.check).to be false
    end
  end
  context 'Dates same as bookings feature spec' do
    it 'should return true' do
      dates = DatesChecker.new(
        date_from: "31/10/2023",
        date_to: "01/12/2023"
      )
      expect(dates.check).to be true
    end
  end
end
