/*
 * Copyright (C)2005-2015 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
package haxe;

/**
	Crossplatform JSON API : it will automatically use the optimized native API if available.
	Use -D haxeJSON to force usage of the haXe implementation even if a native API is found : this will provide
	extra encoding features such as enums (replaced by their index), Hashs and Iterable.
**/
#if ((objc_version>=5) && !haxeJSON)
	import objc.foundation.NSError;
	import objc.foundation.NSString;
	import objc.foundation.NSData;
	import objc.foundation.NSJSONSerialization;
#end

class Json {

	/**
		Parses given JSON-encoded `text` and returns the resulting object.

		JSON objects are parsed into anonymous structures and JSON arrays
		are parsed into Array<Dynamic>.

		If given `text` is not valid JSON, an exception will be thrown.
	**/
	public static inline function parse( text : String ) : Dynamic {
		return haxe.format.JsonParser.parse(text);
	}

	/**
		Encodes given `value` and returns the resulting JSON string.

		If `replacer` is given and is not null, it is used to retrieve
		actual object to be encoded. The `replacer` function two parameters,
		the key and the value being encoded. Initial key value is an empty string.
		
		If `space` is given and is not null, the result will be pretty-printed.
		Successive levels will be indented by this string.
	**/
	public static inline function stringify( value : Dynamic, ?replacer:Dynamic -> Dynamic -> Dynamic, ?space : String ) : String {
		return haxe.format.JsonPrinter.print(value, replacer, space);
	}

}
