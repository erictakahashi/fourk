require 'test_helper'

class EstablishmentTest < ActiveSupport::TestCase
  test "validates presence of establisment name" do
    establishment = Establishment.new name: nil
    refute establishment.valid?
    assert_includes establishment.errors[:name], I18n.t('activerecord.errors.messages.blank')

  #  assert_includes establishment.errors.messages, :name
  end

  test "validates presence of establisment address" do
    establishment = Establishment.new address: '    '
    refute establishment.valid?
    assert_includes establishment.errors[:address], I18n.t('activerecord.errors.messages.blank')

  #  assert_includes establishment.errors.messages, :address
  end

  test "validates presence of establisment city" do
    establishment = Establishment.new city: '    '
    refute establishment.valid?
    assert_includes establishment.errors[:city], I18n.t('activerecord.errors.messages.blank')
  end
end
