require 'rails_helper'

RSpec.describe Entry, type: :model do
    #Validations
    it { expect(described_class.new).to validate_presence_of :category_id }
    it { expect(described_class.new).to validate_presence_of :user_id }
    it { expect(described_class.new).to validate_presence_of :title }
    it { expect(described_class.new).to validate_presence_of :content }
    it { expect(described_class.new).to validate_presence_of :deadline }

end