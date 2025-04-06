require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_inclusion_of(:completed).in_array([true, false]) }
  end

  describe 'scopes' do
    let!(:completed_task) { create(:task, completed: true) }
    let!(:incomplete_task) { create(:task, completed: false) }

    describe '.completed' do
      it 'returns only completed tasks' do
        expect(Task.completed).to include(completed_task)
        expect(Task.completed).not_to include(incomplete_task)
      end
    end

    describe '.incomplete' do
      it 'returns only incomplete tasks' do
        expect(Task.incomplete).to include(incomplete_task)
        expect(Task.incomplete).not_to include(completed_task)
      end
    end
  end
end 