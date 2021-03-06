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

// This file is generated from mozilla/SVGFETurbulenceElement.webidl line 13:0. Do not edit!

package js.html.svg;

@:native("SVGFETurbulenceElement")
extern class FETurbulenceElement extends Element
{
	static inline var SVG_TURBULENCE_TYPE_UNKNOWN : Int = 0;
	static inline var SVG_TURBULENCE_TYPE_FRACTALNOISE : Int = 1;
	static inline var SVG_TURBULENCE_TYPE_TURBULENCE : Int = 2;
	static inline var SVG_STITCHTYPE_UNKNOWN : Int = 0;
	static inline var SVG_STITCHTYPE_STITCH : Int = 1;
	static inline var SVG_STITCHTYPE_NOSTITCH : Int = 2;
	
	var baseFrequencyX(default,null) : AnimatedNumber;
	var baseFrequencyY(default,null) : AnimatedNumber;
	var numOctaves(default,null) : AnimatedInteger;
	var seed(default,null) : AnimatedNumber;
	var stitchTiles(default,null) : AnimatedEnumeration;
	var type(default,null) : AnimatedEnumeration;
	var x(default,null) : AnimatedLength;
	var y(default,null) : AnimatedLength;
	var width(default,null) : AnimatedLength;
	var height(default,null) : AnimatedLength;
	var result(default,null) : AnimatedString;
	
}