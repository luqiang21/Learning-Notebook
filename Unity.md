# Basics
- `Update` function is called before each frame is rendered and also before animations are calculated.
- `FixedUpdate` is just called before each physics update.
- Although the various objects' `Start` and `Awake` functions are called in arbitrary order, all the `Awake`s will have finished before the first `Start` is called. This means the code in the a `Start` function can make use of other initializations previously carried out in the `Awake` phase.
- In JavaScript, an attribute name begins with an `@` sign, whilst in `C#`, it is contained within square brackets.
- Tip - Tired of finding the same Objects over and over? Save time with Selections! If you find yourself searching for the same game objects a couple of times, you should try turning them into a group. 
	- (Ctrl-Alt-1) = Save Selection 1 
	- (Ctrl-Shift-1) = Load Selection 1
- If you need to find multiple or all gameobjects with a specific component, you can use the type filter in the search boxes. To specify a type instead of a name, use the format “t: ClassName”. For example to find all AudioSources, you’d use “t: AudioSource”.

## C#
- `#define` You use it to define a symbol. When you use the symbol as the expression that's passed to the `#if` directive, the expression will evaluate to `true`. 
	- If you use `#if` with a undefined symbol, the symbol will be evaluated to `false`.
	- You can also undefine a symbol using `#undef`, then the expression will evaluate to `false`.
- `metadata` is definitions read by your ide (e.g. VS code) from `.dll` file, there is no actual file. In VS code, you can see `[metadata]` before the file name. 
	- Metadata is data about data. In other words, it's information that's used to describe the data that's contained in something like a web page, document, or file. Another way to think of metadata is as a short explanation or summary of what the data is. [source](https://www.lifewire.com/metadata-definition-and-examples-1019177)
	- C# Metadata describes every type and member defined in your code in a language-neutral manner. Metadata stores the following information: [source](https://docs.microsoft.com/en-us/dotnet/standard/metadata-and-self-describing-components)
		- Description of the assembly.
			- Identity (name, version, culture, public key).
			- The types that are exported.
			- Other assemblies that this assembly depends on.
			- Security permissions needed to run.
		- Description of types.
			- Name, visibility, base class, and interfaces implemented.
			- Members (methods, fields, properties, events, nested types).
		- Attributes.
			- Additional descriptive elements that modify types and members.
	
### Tips
- You shouldn't drag a real object, you should drag the prefab from `Project`
- `ctrl`/`cmd` + left arrow to collapse all elements
