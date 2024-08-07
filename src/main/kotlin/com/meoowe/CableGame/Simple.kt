package com.meoowe.CableGame

import godot.Node3D
import godot.annotation.RegisterClass
import godot.annotation.RegisterFunction
import godot.global.GD

@RegisterClass
class Simple: Node3D() {

    @RegisterFunction
    override fun _ready() {
        GD.print("Hello mess of cables!")
    }
}
