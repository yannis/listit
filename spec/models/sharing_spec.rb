# frozen_string_literal: true

require "rails_helper"

RSpec.describe Sharing, type: :model do
  describe "validations" do
    let(:sharing) { build :sharing }

    it { expect(:sharing).to validate_uniqueness_of(:recipient_id).scoped_to([:list, :accepted]) }

    describe "email" do
      context "when badly formattef" do
        let(:sharing) { build :sharing, email: "badly_formatted@example", recipient: nil }

        it do
          expect(sharing).not_to be_valid
          expect(sharing.errors).to contain_exactly("The email format is not valid")
        end
      end

      context "when doesn't exist" do
        let(:sharing) { build :sharing, email: "dont_exist@example.com", recipient: nil }

        it do
          expect(sharing).not_to be_valid
          expect(sharing.errors).to contain_exactly("The email address does not belong to a ListIt user")
        end
      end

      context "when exists" do
        let(:recipient) { create :user, email: "exist@example.com" }
        let(:sharing) { build :sharing, email: recipient.email, recipient: nil }

        it do
          expect(sharing).to be_valid
        end
      end
    end
  end
end
