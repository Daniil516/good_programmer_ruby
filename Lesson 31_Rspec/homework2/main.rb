require_relative 'lib/credit_request'

# age - возраст
# gender - пол (m/w)
# salary - доход
# credit_history - кредитная история (y/n)
# request_amount - запрашиваемая сумма

puts "Welcome! We are happy to see your credit request!"
puts

puts "How old are you?"
age = gets.to_i

puts "What is your salary in usd?"
salary = gets.to_i

puts "What is your gender (m/w):"
gender = gets[0]

puts "Do you have credit history (y/n)?"
credit_history = gets[0]

puts "How much money do you want to borrow?"
request_amount = gets.to_i

credit_request =
  CreditRequest.new(age, salary, gender, credit_history, request_amount)

if credit_request.approve?
  puts "Your credit request is approved!"
else
  puts "I am sorry, we cannot approve your credit request."
end
