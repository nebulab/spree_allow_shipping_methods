require 'spec_helper'

describe Spree::ShippingMethod do
  let(:shipping_method) { Spree::ShippingMethod.new }

  describe '#allow_to_display' do
    context 'when allowed_for is set to both' do
      before do
        shipping_method.allowed_for = :both
      end

      describe 'and order belongs to a user' do
        it { expect(shipping_method.allowed_to_display(true)).to be_truthy }
      end

      describe 'and order belongs to a guest' do
        it { expect(shipping_method.allowed_to_display(false)).to be_truthy }
      end
    end

    context 'when allowed_for is set to guest' do
      before do
        shipping_method.allowed_for = :guest
      end

      describe 'and order belongs to a user' do
        it { expect(shipping_method.allowed_to_display(true)).to be_falsy }
      end

      describe 'and order belongs to a guest' do
        it { expect(shipping_method.allowed_to_display(false)).to be_truthy }
      end
    end

    context 'when allowed_for is set to user' do
      before do
        shipping_method.allowed_for = :user
      end

      describe 'and order belongs to a user' do
        it { expect(shipping_method.allowed_to_display(true)).to be_truthy }
      end

      describe 'and order belongs to a guest' do
        it { expect(shipping_method.allowed_to_display(false)).to be_falsy }
      end
    end
  end
end
