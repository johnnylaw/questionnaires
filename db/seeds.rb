# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# q6 = Questionnaire.create(
#   title: 'To what degree do you witness these impacts on your team?',
# )
#
# q6_questions = [
#   'The source of ideas being outside the team leads to sub-par ideas.',
#   'The source of ideas being outside the team leads to a lack of team empowerment.',
#   'Business cases',
#   '',
#   '',
#   '',
#   '',
#   '',
# ]
#
# q6_options = [
#   [1, 'Not at all'],
#   [2, 'Not much'],
#   [3, 'Not sure'],
#   [4, 'Somewhat'],
#   [5, 'Every day'],
# ].each do |numerical, name|
#   Option.create(numerical: numerical, name: name)
# end

q64 = Questionnaire.create(
  title: 'How would you rate the day-to-day operations of your team on this scale?',
  # subtitle: 'Remember this isn\'t an admission of fault, and the responses are totally anonymous.',
  permalink: 'good-bad-team',
)

q64_option_set = OptionSet.create name: 'Bad-thru-good-5'

q64_options = [
  [1, 'Bad'],
  [2, 'Largely bad'],
  [3, 'Mixed'],
  [4, 'Largely good'],
  [5, 'Good'],
].each do |numerical, name|
  Option.create(numerical: numerical, name: name, option_set: q64_option_set)
end

q64_questions = [
  %Q(Good teams have a compelling product vision that they pursue with a missionary‐like passion. Bad teams are mercenaries.),
  %Q(Good teams get their inspiration and product ideas from their vision and objectives, from observing customers' struggle, from analyzing the data customers generate from using their product, and from constantly seeking to apply new technology to solve real problems. Bad teams gather requirements from sales and customers.),
  %Q(Good teams understand who each of their key stakeholders are, they understand the constraints that these stakeholders operate in, and they are committed to inventing solutions that work not just for users and customers, but also work within the constraints of the business. Bad teams gather requirements from stakeholders.),
  %Q(Good teams are skilled in the many techniques to rapidly try out product ideas to determine which ones are truly worth building. Bad teams hold meetings to generate prioritized roadmaps.),
  %Q(Good teams love to have brainstorming discussions with smart thought leaders from across the company. Bad teams get offended when someone outside their team dares to suggest they do something. ),
  %Q(Good teams have product, design, and engineering sit side by side, and they embrace the give and take between the functionality, the user experience, and the enabling technology. Bad teams sit in their respective silos, and ask that others make requests for their services in the form of documents and scheduling meetings.),
  %Q(Good teams are constantly trying out new ideas to innovate, but doing so in ways that protect the revenue and protect the brand. Bad teams are still waiting for permission to run a test.),
  %Q(Good teams insist they have the skill sets on their team, such as strong product design, necessary to create winning products. Bad teams don't even know what product designers are.),
  %Q(Good teams ensure that their engineers have time to try out the prototypes in discovery every day so that they can contribute their thoughts on how to make the product better. Bad teams show the prototypes to the engineers during sprint planning so they can estimate. ),
  %Q(Good teams engage directly with end users and customers every week, to better understand their customers, and to see the customer's response to their latest ideas. Bad teams think they are the customer. ),
  %Q(Good teams know that many of their favorite ideas won't end up working for customers, and even the ones that could will need several iterations to get to the point where they provide the desired outcome. Bad teams just build what's on the roadmap, and are satisfied with meeting dates and ensuring quality.),
  %Q(Good teams understand the need for speed and how rapid iteration is the key to innovation, and they understand this speed comes from the right techniques and not forced labor. Bad teams complain they are slow because their colleagues are not working hard enough.),
  %Q(Good teams make high‐integrity commitments after they've evaluated the request and ensured they have a viable solution that will work for the customer and the business. Bad teams complain about being a sales‐driven company.),
  %Q(Good teams instrument their work so they can immediately understand how their product is being used and make adjustments based on the data. Bad teams consider analytics and reporting a nice to have.),
  %Q(Good teams integrate and release continuously, knowing that a constant stream of smaller releases provides a much more stable solution for their customers. Bad teams test manually at the end of a painful integration phase and then release everything at once.),
  %Q(Good teams obsess over their reference customers. Bad teams obsess over their competitors.),
  %Q(Good teams celebrate when they achieve a significant impact to the business results. Bad teams celebrate when they finally release something.),
]
q64_questions.each.with_index do |body, index|
  Question.create questionnaire: q64, body: body, option_set: q64_option_set, number: index
end
