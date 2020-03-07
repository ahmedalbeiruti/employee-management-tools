# frozen_string_literal: true

require 'rails_helper'

RSpec.describe JoinEmployeesToTask, type: :model do
  it { should belong_to(:employee) }
  it { should belong_to(:task) }
end
