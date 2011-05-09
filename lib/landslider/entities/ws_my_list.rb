
class Landslider

	class WsMyList < Object
		
		# @return [Integer]
		attr_reader :my_list_id, :created_by
		
		# @return [String]
		attr_reader :title, :description, :base_table
		
		# @return [Date]
		attr_reader :created_on
		
		# @return [Boolean]
		attr_reader :is_shared
		
	end
	
end
