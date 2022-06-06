require 'require_all'
require_all 'app/helpers'

RSpec.describe DatesChecker do
  context 'When both dates are in the future and date_to is after date_from' do
    it 'should return true' do
      dates = DatesChecker.new(
        date_from: Time.now + (20 * 24 * 60 * 60),
        date_to: Time.now + (30 * 24 * 60 * 60)
      )
      expect(dates.check).to be true
    end
  end
  context 'When both dates are in the future BUT date_to is before date_from' do
    it 'should return true' do
      dates = DatesChecker.new(
        date_from: Time.now + (30 * 24 * 60 * 60),
        date_to: Time.now + (20 * 24 * 60 * 60)
      )
      expect(dates.check).to be false
    end
  end
  context 'When date_to is after date_from but date_from is in the past' do
    it 'should return false' do
      dates = DatesChecker.new(
        date_from: Time.now - (20 * 24 * 60 * 60),
        date_to: Time.now + (30 * 24 * 60 * 60)
      )
      expect(dates.check).to be false
    end
  end
end
