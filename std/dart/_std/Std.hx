package;

/**
	The Std class provides standard methods for manipulating basic types.
**/
@:coreApi class Std {
	/**
		DEPRECATED. Use `Std.isOfType(v, t)` instead.

		Tells if a value `v` is of the type `t`. Returns `false` if `v` or `t` are null.

		If `t` is a class or interface with `@:generic` meta, the result is `false`.
	**/
	@:deprecated('Std.is is deprecated. Use Std.isOfType instead.')
	public static inline function is(v:Dynamic, t:Dynamic):Bool
		return isOfType(v, t);

	/**
		Tells if a value `v` is of the type `t`. Returns `false` if `v` or `t` are null.

		If `t` is a class or interface with `@:generic` meta, the result is `false`.
	**/
	public static inline function isOfType(v:Dynamic, t:Dynamic):Bool
		return untyped __dart__("({0}.runtimeType == {1})", v, t);

	/**
		Checks if object `value` is an instance of class or interface `c`.

		Compiles only if the type specified by `c` can be assigned to the type
		of `value`.

		This method checks if a downcast is possible. That is, if the runtime
		type of `value` is assignable to the type specified by `c`, `value` is
		returned. Otherwise null is returned.

		This method is not guaranteed to work with core types such as `String`,
		`Array` and `Date`.

		If `value` is null, the result is null. If `c` is null, the result is
		unspecified.
	**/
	public static inline function downcast<T:{}, S:T>(value:T, c:Class<S>):S
		return untyped __dart__("({0} as {1})", value, S);

	@:deprecated('Std.instance() is deprecated. Use Std.downcast() instead.')
	public static inline function instance<T:{}, S:T>(value:T, c:Class<S>):S
		return downcast(value, c);

	/**
		Converts any value to a String.

		If `s` is of `String`, `Int`, `Float` or `Bool`, its value is returned.

		If `s` is an instance of a class and that class or one of its parent classes has
		a `toString` method, that method is called. If no such method is present, the result
		is unspecified.

		If `s` is an enum constructor without argument, the constructor's name is returned. If
		arguments exists, the constructor's name followed by the String representations of
		the arguments is returned.

		If `s` is a structure, the field names along with their values are returned. The field order
		and the operator separating field names and values are unspecified.

		If s is null, "null" is returned.
	**/
	public static inline function string(s:Dynamic):String
		return untyped s.toString();

	/**
		Converts a `Float` to an `Int`, rounded towards 0.

		If `x` is outside of the signed Int32 range, or is `NaN`, `NEGATIVE_INFINITY` or `POSITIVE_INFINITY`, the result is unspecified.
	**/
	public static inline function int(x:Float):Int
		return untyped x.truncate();

	/**
		Converts a `String` to an `Int`.

		Leading whitespaces are ignored.

		`x` may optionally start with a + or - to denote a postive or negative value respectively.

		If the optional sign is followed 0x or 0X, hexadecimal notation is recognized where the following
		digits may contain 0-9 and A-F. Both the prefix and digits are case insensitive.

		Otherwise `x` is read as decimal number with 0-9 being allowed characters. Octal and binary
		notations are not supported.

		Parsing continues until an invalid character is detected, in which case the result up to
		that point is returned. Scientific notation is not supported. That is `Std.parseInt('10e2')` produces `10`.

		If `x` is `null`, the result is `null`.
		If `x` cannot be parsed as integer or is empty, the result is `null`.

		If `x` starts with a hexadecimal prefix which is not followed by at least one valid hexadecimal
		digit, the result is unspecified.
	**/
	public static inline function parseInt(x:String):Null<Int>
		return untyped __dart__("int.tryParse({0})", x);

	/**
		Converts a `String` to a `Float`.

		The parsing rules for `parseInt` apply here as well, with the exception of invalid input
		resulting in a `NaN` value instead of `null`. Also, hexadecimal support is **not** specified.

		Additionally, decimal notation may contain a single `.` to denote the start of the fractions.

		It may also end with `e` or `E` followed by optional minus or plus sign and a sequence of
		digits (defines exponent to base 10).
	**/
	public static inline function parseFloat(x:String):Float
		return untyped __dart__("double.tryParse({0})", x);

	/**
		Return a random integer between 0 included and `x` excluded.

		If `x <= 1`, the result is always 0.
	**/
	public static inline function random(x:Int):Int
		return 0;
}
