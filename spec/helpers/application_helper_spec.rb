require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '.form_errors' do
    let(:form) { build(:post, title: nil, description: nil) }
    subject do
      form.valid?
      form_errors(form)
    end

    it { is_expected.to include 'alert-danger' }

    context 'with fields' do
      it { is_expected.to include t('activerecord.errors.models.post.attributes.title.blank') }
      it { is_expected.to include t('activerecord.errors.models.post.attributes.description.blank') }
    end

    context 'when parameter is nil' do
      it 'returns empty string' do
        expect(form_errors(nil)).to be_empty
      end
    end

    context 'when parameter is not nil and not ActiveRecord' do
      it 'raise error NoMethodError' do
        expect { form_errors('WRONG_PARAM') }.to raise_error NoMethodError
      end
    end
  end

  describe '.flash_message' do
    subject { flash_message(flash) }

    context 'with notice' do
      let(:flash) { { notice: Faker::Lorem.sentence(5) } }

      it { is_expected.to include flash[:notice] }
      it { is_expected.to include 'alert-success' }
    end

    context 'with alert' do
      let(:flash) { { alert: Faker::Lorem.sentence(5) } }

      it { is_expected.to include flash[:alert] }
      it { is_expected.to include 'alert-danger' }
    end
  end
end