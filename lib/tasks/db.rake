namespace :db do
  desc "Remaking data"
  task remake_data: :environment do
    Rake::Task["db:migrate:reset"].invoke

    puts "Creating admin"
    FactoryGirl.create :user, role: 1, email: "admin@pro.com"

    puts "Creating users"
    FactoryGirl.create :user, role: 0, email: "user@pro.com"
    20.times {FactoryGirl.create :user, role: 0}

    # puts "Creating User relationships"
    # 20.times {FactoryGirl.create :relationship}

    puts "Creating Reviews and Ratings"
    70.times {FactoryGirl.create :review}

    puts "Creating books"
    40.times {FactoryGirl.create :book}

    # puts "Creating ranks 1 to 10"
    # FactoryGirl.create_list :rank, 10

    # puts "Creating positions"

    # Settings.data.position.to_h.values.each{|name| FactoryGirl.create :position, name: name}

    # puts "Creating price periods"
    # 2.times {FactoryGirl.create :period}

    # puts "Importing groups"
    # import = Import.new "#{Rails.root}/lib/assets/groups.json", Group, :id, "group"
    # import.save! if import.valid?

    # puts "Importing teams"
    # import = Import.new "#{Rails.root}/lib/assets/teams.json", Team, :id, "team"
    # import.save! if import.valid?

    # puts "Importing employees"
    # import = Import.new "#{Rails.root}/lib/assets/users.csv", Employee, :email, "employee"
    # import.save! if import.valid?

    # puts "Importing group employees"
    # import = Import.new "#{Rails.root}/lib/assets/group_users.json", GroupEmployee, :id, "group_employee"
    # import.save! if import.valid?

    # puts "Creating skill"
    # ["Ruby", "Android", "IOS", "Python", "PHP", "C", "C++", "C#", "JS", "Unity", "Cocos2d", "Win 8 App", "Infra"].each do |skill_name|
    #   FactoryGirl.create :skill, name: skill_name
    # end

    # puts "Creating salaries, evaluations, evaluation details for employees"
    # Employee.all.each do |employee|
    #   employee.update_attributes(position: Position.all.sample)
    #   FactoryGirl.create :salary, employee: employee, fixed: true

    #   FactoryGirl.create :evaluation, employee: employee

    #   FactoryGirl.create :employee_skill,
    #     employee: employee,
    #     skill: Skill.order("RAND()").first

    #   Period.all.each do |period|
    #     EvaluationDetail::LIST_EVALUATION_TYPE.each do |evaluation_type|
    #       FactoryGirl.create :evaluation_detail, employee: employee, evaluation_type: evaluation_type,
    #         period: period
    #     end
    #   end
    # end

    # puts "Creating projects"
    # 5.times {FactoryGirl.create :project}

    # puts "Completed rake data"
  end
end
