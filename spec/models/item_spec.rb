# frozen_string_literal: true

require "rails_helper"

RSpec.describe Item do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe ".cross!" do
    let(:item) { build :item }

    it { expect { item.cross! }.to change(item, :crossed_at).from(nil) }
  end

  describe ".uncross!" do
    let(:item) { build :item, :crossed }

    it { expect { item.uncross! }.to change(item, :crossed_at).to(nil) }
  end
end
