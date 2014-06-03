About the tests folder - 

	Tests serve a lot of different purposes and in different ways.
	Some tests cannot be automated. 
	Some tests can be automated.
	Some tests are testing wip features.
	Some tests are stress testing the language features.

Tests are an ongoing endeavour in any code base and often require constant work, so there are likely gaps. You can help resolve this.

This folder contains tests according to the followint basic structure :
All tests demonstrate usage, validate correctness, and are usually extensively commented with rationale for insight into why things are a certain way. 
Tests for features are usually created as an empty project, and a feature hacked in an isolated project, once confirmed to be correct and stable are merged back into the API, 
making the test case to use the new classes in the engine as a baseline test.

	features/
		- contains examples, samples, demos, tests and essentially help in debugging things in specific features, a baseline for a feature.
	rendering/
		- rendering has a lot of specifics so it has it's own folder. 
	three/
		- tests for the 3D features. Note that 3D exists as a concept but is not official yet.
	unit/
		- automated code based validation covering critical systems where applicable.
	utils/
		- tests stress testing utilities in the engine that don't fit elsewhere
	wip/
		- this folder is basically an anything goes test bed for developing features that will be promoted to features later. Don't be afraid to store a test project in here while developing a feature, whether it works or not. The more you comment and describe your commits the better, of course.

