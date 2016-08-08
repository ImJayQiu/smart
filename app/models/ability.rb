class Ability
	include CanCan::Ability


	def initialize(user)
		# Define abilities for the passed in user here. For example:
		#
		user ||= User.new # guest user (not logged in)

		if user.role == "Admin"
			can :manage, :all
			# can :list, [:students, :lecturers, :deans, :admins]
			cannot :del, user, :code => user.code
		end

		if user.role == "Dean"
			can :manage, :all                                  # can CRUD users model 
			cannot :list, :admins                              # list all user menu
			cannot :manage, User, role: "Admin"                # can not touch admin user 
			cannot [:edit,:del], User, role: "Dean"            # can not edit and del Deans 
			can :edit, user, id: user.id                       # can edit self
		end

		if user.role == "Lecturer"
			can :list, [:students, :lecturers]         # can list students and lecturers
			can :show, user                                    # can show all users 
			cannot :show, user, role: ['Dean', 'Admin']        # cannot show Admin and Dean users 
			cannot [:edit, :del], user                         # cannot edit any users 
			can :edit, user, id: user.id                       # can edit self
		end

		if user.role == "Student"
			cannot :manage, :all                               # cannot do anything 
			can [:show, :edit], user, :code == user.code	   # can edit self 
			#cannot :manage, Visa #, :passport == user.passport	   # can view self visa 
			#can :manage, Visa, :passport == user.passport	   # can view self visa 
		end

		if user.role == "Staff"
			cannot :manage, :all                               # cannot do anything 
			can :list, [:students, :lecturers, :visas, :ustatus]         # can list students and lecturers
			cannot [:show, :edit, :del], user                   
			can [:show, :edit], user, :code == user.code	   # can edit self 
			can :manage, :visa	                               # can manage visa 
			can :manage, :ustatus	                           # can manage users status 
		end


		#
		# The first argument to `can` is the action you are giving the user
		# permission to do.
		# If you pass :manage it will apply to every action. Other common actions
		# here are :read, :create, :update and :destroy.
		#
		# The second argument is the resource the user can perform the action on.
		# If you pass :all it will apply to every resource. Otherwise pass a Ruby
		# class of the resource.
		#
		# The third argument is an optional hash of conditions to further filter the
		# objects.
		# For example, here the user can only update published articles.
		#
		#   can :update, Article, :published => true
		#
		# See the wiki for details:
		# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
	end
end
