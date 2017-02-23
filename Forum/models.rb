class Forum < ActiveRecord::Base
end
class Review < ActiveRecord::Base
end
class Movie < ActiveRecord::Base
end
class Register < ActiveRecord::Base
	has_secure_password
end
