const std = @import("std");

pub extern fn buffer_create(len: usize) ?*c_void;
pub extern fn buffer_destroy(ptr: ?*c_void) void;
pub extern fn buffer_write(buf: ?*c_void, offset: usize, data: ?*const c_void, len: usize) void;
pub extern fn buffer_read(buf: ?*c_void, offset: usize, data: ?*c_void, len: usize) void;

pub fn main() void {
    const buf = buffer_create(8);
    defer buffer_destroy(buf);

    buffer_write(buf, 0, "World", 6);

    {
        var str: [8]u8 = undefined;
        buffer_read(buf, 0, &str, 6);
        std.log.info("Hello, {s}!", .{str[0..6]});
    }
}
