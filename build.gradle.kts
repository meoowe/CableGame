plugins {
    id("com.utopia-rise.godot-kotlin-jvm") version "0.9.0-4.2.2"
}

repositories {
    mavenCentral()
}

kotlin {
    jvmToolchain(17)
}

godot {
    // START: registration options
    // regular setup
    // the script registration which you'll attach to nodes are generated into this directory
    registrationFileBaseDir.set(projectDir.resolve("gdj").also { it.mkdirs() })

    // defines whether the script registration files should be generated hierarchically according to the classes package path or flattened into `registrationFileBaseDir`
    //isRegistrationFileHierarchyEnabled.set(true)

    // defines whether your scripts should be registered with their fqName or their simple name (can help with resolving script name conflicts)
    //isFqNameRegistrationEnabled.set(false)

    // library setup. See: https://godot-kotl.in/en/stable/develop-libraries/
    // only really needed for library authors. See: https://godot-kotl.in/en/stable/develop-libraries/setup/
    //classPrefix.set("MyCustomClassPrefix")

    // only needed for library authors. See: https://godot-kotl.in/en/stable/develop-libraries/setup/
    //projectName.set("LibraryProjectName")

    // only needed for library authors. See: https://godot-kotl.in/en/stable/develop-libraries/setup/
    //projectName.set("LibraryProjectName")

    // only needed for library authors. See: https://godot-kotl.in/en/stable/develop-libraries/setup/
    //isRegistrationFileGenerationEnabled.set(true)
    // END: registration options

    // -------------------------

    // START: android export options
    // NOTE: Make sure you read: https://godot-kotl.in/en/stable/user-guide/exporting/#android as not all jvm libraries are compatible with android!
    // IMPORTANT: Android export should to be considered from the start of development!
    isAndroidExportEnabled.set(false)
    d8ToolPath.set(File("${System.getenv("ANDROID_SDK_ROOT")}/build-tools/31.0.0/d8"))
    androidCompileSdkDir.set(File("${System.getenv("ANDROID_SDK_ROOT")}/platforms/android-30"))
    // END: android export options

    // -------------------------

    // START: graal native image export options
    // NOTE: this is an advanced feature! Read: https://godot-kotl.in/en/stable/user-guide/advanced/graal-vm-native-image/
    // IMPORTANT: Graal Native Image needs to be considered from the start of development!
    isGraalNativeImageExportEnabled.set(false)
    graalVmDirectory.set(File("${System.getenv("GRAALVM_HOME")}"))
    windowsDeveloperVCVarsPath.set(File("${System.getenv("VC_VARS_PATH")}"))
    isIOSExportEnabled.set(false)
    // END: graal native image export options
}
