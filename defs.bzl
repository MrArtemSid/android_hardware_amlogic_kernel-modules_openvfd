load("//build/kernel/kleaf:kernel.bzl", "kernel_module")


def openvfd_module(name, kernel_build, deps = None):
    kernel_module(
        name = name,
        srcs = ["//vendor/amlogic/openvfd:openvfd_srcs"],
        makefile = ["//vendor/amlogic/openvfd:Makefile"],
        deps = deps,
        outs = ["openvfd.ko"],
        kernel_build = kernel_build,
    )
