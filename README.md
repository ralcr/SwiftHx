![Haxe logo](http://ralcr.com/objc.png)
# [Objc target for Haxe language](http://haxe.org)

## Building from sources

 1. Clone the repository, initialize and fetch the submodules.

        git clone git@github.com:ralcr/haxe.git
        cd haxe
        git submodule init
        git submodule update

 2. You now need to hardcode the path to the new std lib. In main.ml file at around line 810 change the first path to match yours:

		com.class_path <- ["/Users/Cristi/Documents/haxecompiler/haxe/std/";"";"/"]

 3. Build Haxe with:

		make haxe

 4. Or build Haxe and the tools with:

		make

 5. On Mac you can run the build.sh script that will compile Haxe and will build the demos as well:

		./build.sh
	
 6. If something is not working run first:

		make clean
		make

 7. Bringing HF/haxe changes in this fork (when needed, usually the fork is up to date)

	git fetch upstream
	git merge upstream/development

## Getting started with iOS

The starting point of your app should look like this, everything else is ignored:

	public static function main() {
		return new UIApplicationMain ( AppDelegate );
	}

Where the AppDelegate.hx conforms with the UIApplicationDelegate. This is the main method of your app, you should put the code before returning.

	class AppDelegate extends UIResponder implements UIApplicationDelegate {
		public function application (application:UIApplication, didFinishLaunchingWithOptions:NSDictionary) :Bool {
			// See the demos from hxcocoa lib please
			return true;
		}
	}
