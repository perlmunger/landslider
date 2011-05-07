
class Landslider
	
	# A list of operators that can be used with WsSearchCriterion
	class WsSearchOperator

		# returns values that contain the given search string
		CONTAINS='Contains'
		# returns values that "sound like" the given search string (smythe = smith)
		SOUNDS_LIKE='SoundsLike'
		#
		STARTS_WITH='StartsWith'
		#
		ENDS_WITH='EndsWith'
		DOES_NOT_CONTAIN='DoesNotContain'
		# returns values that are identically equal (case-insensitive) the given search value
		EQUALS='Equals'
		# returns values that are not  equal (case-insensitive) the given search value
		NOT_EQUALS='NotEquals'
		LESS_THAN='LessThan'
		# returns values that are less than or equal to the given search value
		LESS_THAN_OR_EQUAL='LessThanOrEqual'
		# returns values that are greater than the given search value
		GREATER_THAN='GreaterThan'
		# returns values that are greater than or equal to the given search value
		GREATER_THAN_OR_EQUAL='GreaterThanOrEqual'
		# returns values that are empty (null)
		EMPTY='Empty'
		# returns values that are not empty (not null)
		NOT_EMPTY='NotEmpty'
		# returns values that are logically True
		TRUE='True'
		# returns values that are logically False
		FALSE='False'
		# returns values that are in the specified list
		IN='In'
		# returns values that are not in the specified list
		NOT_IN='NotIn'
	end
	
end
