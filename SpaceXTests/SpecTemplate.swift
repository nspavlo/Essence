//
//  SpecTemplate.swift
//  SpaceXTests
//
//  Created by Jans Pavlovs on 30/01/2021.
//

import Quick
import Nimble

@testable import SpaceX

// MARK: Specification

class SpecTemplate: QuickSpec {
    override func spec() {
        describe("specification") {
            context("given current specification") {
                let sut = Specification()

                it("is enabled") {
                    expect(sut.isEnabled).to(beTrue())
                }
            }
        }
    }
}

// MARK: -

struct Specification {
    let isEnabled = true
}
