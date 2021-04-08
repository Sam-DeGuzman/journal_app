require 'rails_helper'

RSpec.describe Category, type: :model do
    #Validations
    it { expect(described_class.new).to validate_presence_of :category_name }
    it { expect(described_class.new).to validate_presence_of :description }
    it { expect(described_class.new).to validate_presence_of :user_id }
    it { expect(described_class.new).to validate_uniqueness_of :category_name }
    it { expect(described_class.new).to validate_uniqueness_of :user_id }


end