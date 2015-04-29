// RUN: %target-swift-frontend -primary-file %s -emit-ir -g -o - | FileCheck %s

// Verify that we generate appropriate names for accessors.
// CHECK: !DISubprogram(name: "x.get"
// CHECK: !DISubprogram(name: "x.set"

// Variable getter/setter
var _x : Int = 0
var x_modify_count : Int = 0
var x: Int {
  get {
    return _x
  }
  set {
    x_modify_count = x_modify_count + 1
    _x = newValue
  }
}
