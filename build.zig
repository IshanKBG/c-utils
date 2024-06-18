const std = @import("std");

pub fn build(b: *std.Build) void {
    const kbg = b.addStaticLibrary(.{
        .name = "kbg",
        .target = b.host,
        .optimize = .ReleaseSafe,
        .version = .{ .major = 0, .minor = 1, .patch = 0 },
        .link_libc = true,
    });
    kbg.addIncludePath(b.path("src"));
    kbg.installHeader(b.path("src/defines.h"), "kbg/defines.h");
    kbg.addCSourceFiles(.{ .root = b.path("src"), .files = &.{"main.c"} });
    b.installArtifact(kbg);
}
