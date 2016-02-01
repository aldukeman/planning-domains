(define (problem roverprob8271) (:domain rover)
(:objects
	camera2 - camera
	objective2 - objective
	waypoint6 - waypoint
	rover3store - store
	low_res - mode
	waypoint5 - waypoint
	rover0store - store
	waypoint2 - waypoint
	waypoint0 - waypoint
	general - lander
	objective3 - objective
	waypoint1 - waypoint
	colour - mode
	high_res - mode
	camera0 - camera
	camera1 - camera
	waypoint3 - waypoint
	camera3 - camera
	camera4 - camera
	camera5 - camera
	objective1 - objective
	rover2store - store
	objective0 - objective
	rover1store - store
	waypoint4 - waypoint

	(:private
		rover1 - rover
	)
)
(:init
	(visible waypoint0 waypoint6)
	(visible waypoint6 waypoint0)
	(visible waypoint1 waypoint0)
	(visible waypoint0 waypoint1)
	(visible waypoint1 waypoint2)
	(visible waypoint2 waypoint1)
	(visible waypoint1 waypoint5)
	(visible waypoint5 waypoint1)
	(visible waypoint2 waypoint0)
	(visible waypoint0 waypoint2)
	(visible waypoint2 waypoint4)
	(visible waypoint4 waypoint2)
	(visible waypoint2 waypoint6)
	(visible waypoint6 waypoint2)
	(visible waypoint3 waypoint5)
	(visible waypoint5 waypoint3)
	(visible waypoint4 waypoint0)
	(visible waypoint0 waypoint4)
	(visible waypoint4 waypoint1)
	(visible waypoint1 waypoint4)
	(visible waypoint4 waypoint3)
	(visible waypoint3 waypoint4)
	(visible waypoint5 waypoint0)
	(visible waypoint0 waypoint5)
	(visible waypoint5 waypoint6)
	(visible waypoint6 waypoint5)
	(visible waypoint6 waypoint4)
	(visible waypoint4 waypoint6)
	(at_soil_sample waypoint0)
	(at_rock_sample waypoint0)
	(at_rock_sample waypoint1)
	(at_soil_sample waypoint3)
	(at_rock_sample waypoint3)
	(at_soil_sample waypoint4)
	(at_rock_sample waypoint4)
	(at_soil_sample waypoint6)
	(at_rock_sample waypoint6)
	(at_lander general waypoint1)
	(channel_free general)
	(empty rover0store)
	(at rover1 waypoint0)
	(available rover1)
	(store_of rover1store rover1)
	(empty rover1store)
	(equipped_for_soil_analysis rover1)
	(equipped_for_imaging rover1)
	(can_traverse rover1 waypoint0 waypoint1)
	(can_traverse rover1 waypoint1 waypoint0)
	(can_traverse rover1 waypoint0 waypoint2)
	(can_traverse rover1 waypoint2 waypoint0)
	(can_traverse rover1 waypoint0 waypoint6)
	(can_traverse rover1 waypoint6 waypoint0)
	(empty rover2store)
	(empty rover3store)
	(on_board camera0 rover1)
	(calibration_target camera0 objective2)
	(supports camera0 low_res)
	(on_board camera1 rover1)
	(calibration_target camera1 objective3)
	(supports camera1 colour)
	(on_board camera2 rover1)
	(calibration_target camera2 objective1)
	(supports camera2 colour)
	(supports camera2 low_res)
	(on_board camera3 rover1)
	(calibration_target camera3 objective2)
	(supports camera3 high_res)
	(supports camera3 low_res)
	(calibration_target camera4 objective0)
	(supports camera4 colour)
	(calibration_target camera5 objective0)
	(supports camera5 colour)
	(supports camera5 high_res)
	(supports camera5 low_res)
	(visible_from objective0 waypoint0)
	(visible_from objective1 waypoint0)
	(visible_from objective1 waypoint1)
	(visible_from objective1 waypoint2)
	(visible_from objective1 waypoint3)
	(visible_from objective2 waypoint0)
	(visible_from objective2 waypoint1)
	(visible_from objective2 waypoint2)
	(visible_from objective2 waypoint3)
	(visible_from objective3 waypoint0)
	(visible_from objective3 waypoint1)
	(visible_from objective3 waypoint2)
	(visible_from objective3 waypoint3)
	(visible_from objective3 waypoint4)
	(visible_from objective3 waypoint5)
)
(:goal
	(and
		(communicated_soil_data waypoint6)
		(communicated_soil_data waypoint0)
		(communicated_soil_data waypoint3)
		(communicated_soil_data waypoint4)
		(communicated_rock_data waypoint4)
		(communicated_rock_data waypoint3)
		(communicated_rock_data waypoint0)
		(communicated_rock_data waypoint1)
		(communicated_image_data objective3 colour)
		(communicated_image_data objective2 colour)
		(communicated_image_data objective3 low_res)
	)
)
)