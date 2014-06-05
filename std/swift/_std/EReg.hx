/*
 * Copyright (c) 2005, The haXe Project Contributors
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE HAXE PROJECT CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE HAXE PROJECT CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 */

@:category("NSRegularExpression") @:coreApi class EReg {

	var r : Dynamic;
	var last : String;
	var global : Bool;

	public function new( r : String, opt : String ) : Void {
			var a = opt.split("g");
			global = a.length > 1;
			if( global )
				opt = a.join("");
			this.r = null;//regexp_new_options(r, opt);
	}

	public function match( s : String ) : Bool {
			var p = true;//regexp_match(r,s,0,s.length);
			if( p )
				last = s;
			else
				last = null;
			return p;
	}

	public function matched( n : Int ) : String {
		var m = null;//regexp_matched(r,n);
		return m;
	}

	public function matchedLeft() : String {
			var p = null;//regexp_matched_pos(r,0);
			return last.substr(0,p.pos);
	}

	public function matchedRight() : String {
			var p = null;//regexp_matched_pos(r,0);
			var sz = p.pos+p.len;
			return last.substr(sz,last.length-sz);
	}

	public function matchedPos() : { pos : Int, len : Int } {
			return null;//regexp_matched_pos(r,0);
	}

	/**
		Tells if [this] regular expression matches a substring of String [s].
		
		This function expects [pos] and [len] to describe a valid substring of
		[s], or else the result is unspecified. To get more robust behavior,
		[this].matchSub(s.substr(pos,len)) can be used instead.
		
		This method modifies the internal state.
		
		If [s] is null, the result is unspecified.
	**/
	public function matchSub( s : String, pos : Int, len : Int = 0):Bool {
		return false;
	}

	public function split( s : String ) : Array<String> {
			var pos = 0;
			var len = s.length;
			var a = new Array();
			var first = true;
			do {
				//if( !regexp_match(r,s,pos,len) )
				//	break;
				var p = null;//regexp_matched_pos(r,0);
				if( p.len == 0 && !first ) {
					if( p.pos == s.length )
						break;
					p.pos += 1;
				}
				a.push(s.substr(pos,p.pos - pos));
				var tot = p.pos + p.len - pos;
				pos += tot;
				len -= tot;
				first = false;
			} while( global );
			a.push(s.substr(pos,len));
			return a;
	}

	public function replace( s : String, by : String ) : String {
			var b = new StringBuf();
			var pos = 0;
			var len = s.length;
			var a = by.split("$");
			var first = true;
			do {
				//if( !regexp_match(r,s,pos,len) )
				//	break;
				var p = null;//regexp_matched_pos(r,0);
				if( p.len == 0 && !first ) {
					if( p.pos == s.length )
						break;
					p.pos += 1;
				}
				b.addSub(s,pos,p.pos-pos);
				if( a.length > 0 )
					b.add(a[0]);
				var i = 1;
				while( i < a.length ) {
					var k = a[i];
					var c = k.charCodeAt(0);
					// 1...9
					if( c >= 49 && c <= 57 ) {
						var p = null;//try regexp_matched_pos(r,Std.int(c)-48) catch( e : String ) null;
						if( p == null ){
							b.add("$");
							b.add(k);
						}else{
							b.addSub(s,p.pos,p.len);
							b.addSub(k,1,k.length - 1);
						}
					} else if( c == null ) {
						b.add("$");
						i++;
						var k2 = a[i];
						if( k2 != null && k2.length > 0 )
							b.add(k2);
					} else
						b.add("$"+k);
					i++;
				}
				var tot = p.pos + p.len - pos;
				pos += tot;
				len -= tot;
				first = false;
			} while( global );
			b.addSub(s,pos,len);
			return b.toString();
	}

	/**
		For each occurence of the pattern in the string [s], the function [f] is called and
		can return the string that needs to be replaced. All occurences are matched anyway,
		and setting the [g] flag might cause some incorrect behavior on some platforms.
	**/
	public function map( s : String, f : EReg -> String ) : String {
		var buf = new StringBuf();
		while( true ) {
			if( !match(s) )
				break;
			buf.add(matchedLeft());
			buf.add(f(this));
			s = matchedRight();
		}
		buf.add(s);
		return buf.toString();
	}
}
