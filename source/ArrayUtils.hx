package;

class ArrayUtils {
	private function ArrayUtils() {}

	public static function orMap<T>(array:Array<T>, predicate:T -> Bool):Bool {
		for (val in array) {
			if (predicate(val)) {
				return true;
			}
		}

		return false;
	}
}