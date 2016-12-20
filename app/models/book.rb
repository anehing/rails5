class Book < ApplicationRecord
	after_create_commit do
		BookBroadcastJob.perform_later self
	end
end
