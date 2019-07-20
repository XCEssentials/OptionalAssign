//
//  Main.swift
//  MKHOptionalAssign
//
//  Created by Maxim Khatskevich on 3/30/16.
//  Copyright © 2016 Maxim Khatskevich. All rights reserved.
//

import Foundation

//---

infix operator ?= : AssignmentPrecedence

public
func ?=<L, R> (left: inout L, right: R?)
{
    if let buf = right as? L
    {
        left = buf
    }
}
