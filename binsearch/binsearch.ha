export fn binsearch64(a: uintptr, b: u64, length: u64) u64;

@test fn _binsearch() void = {
	let a: [256]u64 = [0...];
	for (let i = 0z; i < 256; i += 1) {
		a[i] = i;
	};

	for (let i = 0z; i <= 256; i += 1) {
		assert(i: u64 == binsearch64(&a[0]: uintptr, i, 256));
	};
};
