class BankAndIdentityDetail < ActiveRecord::Base
	belongs_to :user
	validates :bank_account_no, :bank_name ,:branch_name ,:city ,:ifsc_code ,:pancard_no ,presence: true
    validates :bank_account_no, :numericality => true, length: {minimum:6 ,maximum: 16}, uniqueness: true
    validates :city,format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :ifsc_code ,format: {with: /\A[^`!@#\$%\^&*+_=]+\z/},length: {minimum:11 ,maximum: 11}, uniqueness: true
    validates :bank_name,:branch_name, format: {with: /\A[^0-9`!@#\$%\^&*+_=]+\z/ , message: "must be formatted correctly"}
    validates :pancard_no ,format: {with: /(^([A-Z]{5})([0-9]{4})([A-Z]{1})$)/ }, uniqueness: true
    validates :passport_no ,format: {with: /(^[A-PR-WYa-pr-wy][1-9]\d\s?\d{4}[1-9]$)/ ,  :allow_blank => true , uniqueness: true}
    validates :uid_no, :numericality => true, length: {minimum: 12 , maximum: 12} , :allow_blank => true , uniqueness: true
end
 