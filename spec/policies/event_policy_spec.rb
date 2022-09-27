require 'rails_helper'

RSpec.describe EventPolicy do
  subject { described_class }

  let(:event_owner) { FactoryBot.build(:user) }
  let(:user) { FactoryBot.build(:user) }

  let(:event_owner_context) { UserContext.new(event_owner, {}, '') }
  let(:user_context) { UserContext.new(user, {}, '') }
  let(:user_context_with_correct_pin) { UserContext.new(user, {}, '1234') }
  let(:user_context_with_wrong_pin) { UserContext.new(user, {}, '12345') }
  let(:anonymous_context_with_correct_pin) { UserContext.new(nil, {}, '1234') }

  let(:user_context_with_correct_cookies) { UserContext.new(user,
                                                            { "events_#{event_with_pin.id}_pincode" => '1234' }, '') }
  let(:user_context_with_wrong_cookies) { UserContext.new(user,
                                                          { "events_#{event_with_pin.id}_pincode" => '12345' }, '') }
  let(:anonymous_context_with_correct_cookies) { UserContext.new(nil,
                                                                 { "events_#{event_with_pin.id}_pincode" => '1234' }, '') }

  let(:event) { FactoryBot.build(:event, user: event_owner) }
  let(:event_with_pin) { FactoryBot.build(:event, user: event_owner, pincode: '1234') }

  permissions :update? do
    context 'user is event creator' do
      it 'gives access to update event' do
        expect(subject).to permit(event_owner_context, event)
      end
    end
    context 'user is not event creator' do
      it 'denies access to update event' do
        expect(subject).not_to permit(user_context, event)
      end
    end
  end

  permissions :edit? do
    context 'user is event creator' do
      it 'gives access to edit event' do
        expect(subject).to permit(event_owner_context, event)
      end
    end
    context 'user is not event creator' do
      it 'denies access to edit event' do
        expect(subject).not_to permit(user_context, event)
      end
    end
  end

  permissions :destroy? do
    context 'user is event creator' do
      it 'gives access to delete event' do
        expect(subject).to permit(event_owner_context, event)
      end
    end
    context 'user is not event creator' do
      it 'denies access to delete event' do
        expect(subject).not_to permit(user_context, event)
      end
    end
  end

  permissions :show? do
    context 'user is event owner' do
      it 'shows event' do
        expect(subject).to permit(event_owner_context, event)
      end
    end

    context 'anonymous user enters the event' do
      it 'shows if event doesnt have pin' do
        expect(subject).to permit(nil, event)
      end
    end

    context 'event doesnt have pin' do
      it 'shows to any user' do
        expect(subject).to permit(user_context, event)
      end
    end

    context 'event has a pin' do
      it 'doesnt show to user without pin' do
        expect(subject).not_to permit(user_context, event_with_pin)
      end

      context 'user has a pin' do
        it 'shows if pin is correct' do
          expect(subject).to permit(user_context_with_correct_pin, event_with_pin)
        end

        it 'shows event for anonymous if pin is correct' do
          expect(subject).to permit(anonymous_context_with_correct_pin, event_with_pin)
        end

        it 'doesnt show if pin is wrong' do
          expect(subject).not_to permit(user_context_with_wrong_pin, event_with_pin)
        end
      end

      context 'user has pin in cookies' do
        it 'shows if pin is correct' do
          expect(subject).to permit(user_context_with_correct_cookies, event_with_pin)
        end

        it 'doesnt show if pin is wrong' do
          expect(subject).not_to permit(user_context_with_wrong_cookies, event_with_pin)
        end

        it 'shows event for anonymous if pin is correct' do
          expect(subject).to permit(anonymous_context_with_correct_cookies, event_with_pin)
        end
      end
    end
  end
end
