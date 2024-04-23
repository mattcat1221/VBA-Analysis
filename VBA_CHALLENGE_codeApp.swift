//
//  VBA_CHALLENGE_codeApp.swift
//  VBA-CHALLENGE code
//
//  Created by Casey Matthews  on 4/11/24.
//

import SwiftUI
import SwiftData
import UniformTypeIdentifiers

@main
struct VBA_CHALLENGE_codeApp: App {
    var body: some Scene {
        DocumentGroup(editing: .itemDocument, migrationPlan: VBA_CHALLENGE_codeMigrationPlan.self) {
            ContentView()
        }
    }
}

extension UTType {
    static var itemDocument: UTType {
        UTType(importedAs: "com.example.item-document")
    }
}

struct VBA_CHALLENGE_codeMigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        VBA_CHALLENGE_codeVersionedSchema.self,
    ]

    static var stages: [MigrationStage] = [
        // Stages of migration between VersionedSchema, if required.
    ]
}

struct VBA_CHALLENGE_codeVersionedSchema: VersionedSchema {
    static var versionIdentifier = Schema.Version(1, 0, 0)

    static var models: [any PersistentModel.Type] = [
        Item.self,
    ]
}
