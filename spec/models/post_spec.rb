RSpec.describe 'Post', type: :model do
  subject { build(:post) }

  context 'with validation' do
    it 'checks empty title' do
      subject.title = nil
      subject.valid?
      expect(subject.errors[:title]).to include t('activerecord.errors.models.post.attributes.title.blank')
    end

    it 'checks empty description' do
      subject.description = nil
      subject.valid?
      expect(subject.errors[:description]).to include t('activerecord.errors.models.post.attributes.description.blank')
    end

    it 'checks length of title is not more than 255 characters' do
      subject.title = 'hello' * 70
      subject.valid?
      msg = t('activerecord.errors.models.post.attributes.title.too_long', count: 255)
      expect(subject.errors[:title]).to include msg
    end
  end
end
