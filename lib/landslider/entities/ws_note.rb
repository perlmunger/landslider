
class Landslider

	class WsNote < WsEntity
		
		# @return [Integer]
		attr_reader :note_id, :archived_by, :created_by
		
		# @return [String]
		attr_reader :note, :sourceId
		
		# @return [Boolean]
		attr_reader :latest
		
		# @return [Date]
		attr_reader :created_on, :updated_on
		
	end
	
end