FactoryGirl.define do
	factory :user do
		first_name "Jane"
		last_name "Doe"
		sequence(:email) {|n| "jane#{n}@gmail.com"}
		password "password"
	end
end