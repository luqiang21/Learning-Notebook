# Basics
- `Update` function is called before each frame is rendered and also before animations are calculated.
- `FixedUpdate` is just called before each physics update.
- Although the various objects' `Start` and `Awake` functions are called in arbitrary order, all the `Awake`s will have finished before the first `Start` is called. This means the code in the a `Start` function can make use of other initializations previously carried out in the `Awake` phase.
- In JavaScript, an attribute name begins with an `@` sign, whilst in `C#`, it is contained within square brackets.
- Tip - Tired of finding the same Objects over and over? Save time with Selections! If you find yourself searching for the same game objects a couple of times, you should try turning them into a group. 
	- (Ctrl-Alt-1) = Save Selection 1 
	- (Ctrl-Shift-1) = Load Selection 1
- If you need to find multiple or all gameobjects with a specific component, you can use the type filter in the search boxes. To specify a type instead of a name, use the format “t: ClassName”. For example to find all AudioSources, you’d use “t: AudioSource”.

### Tips
- You shouldn't drag a real object, you should drag the prefab from `Project`
- `ctrl`/`cmd` + left arrow to collapse all elements
