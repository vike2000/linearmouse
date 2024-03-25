// MIT License
// Copyright (c) 2021-2024 LinearMouse

import Foundation
import os.log

class ScrollDirectionFlipTransformer: EventTransformer {
    private static let log = OSLog(
        subsystem: Bundle.main.bundleIdentifier!,
        category: "ScrollDirectionFlip"
    )

    func transform(_ event: CGEvent) -> CGEvent? {
//        os_log("flip=%{public}@", log: Self.log, type: .info,
//               String(describing: EventTransformerManager.scrollDirectionFlipState))

        guard EventTransformerManager.scrollDirectionFlipState, event.type == .scrollWheel else {
            return event
        }

        let view = ScrollWheelEventView(event)

        let oldValue = view.matrixValue

        view.swapXY()

        os_log("oldValue=%{public}@, newValue=%{public}@", log: Self.log, type: .info,
               String(describing: oldValue),
               String(describing: view.matrixValue))

        return event
    }
}
