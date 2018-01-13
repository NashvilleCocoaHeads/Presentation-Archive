#!/usr/bin/env xcrun swift

//
//  generate_folders_for_year.swift
//  Presentation Archive
//
//  Created by Blake Merryman on 2018-01-12.
//  Copyright © 2018 Nashville CocoaHeads. All rights reserved.
//
// 	This script generates the folder structure to house presenation materials
//	for a specified year.
//

import Foundation

var rawArguments = CommandLine.arguments
rawArguments.removeFirst() // don't need this system provided info

guard rawArguments.count == 2 else {
  print("Generation failed. Please pass in valid arguments (e.g. --year 2017).")
  exit(EXIT_FAILURE)
}

guard let year = Int(rawArguments[1]) else {
  print("Generation failed. Please pass in valid year (e.g. 2017).")
  exit(EXIT_FAILURE)
}

let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October"]
// No meetups planned for November or December.

let currentDirectoryPath = FileManager.default.currentDirectoryPath

let rangeToRemove = currentDirectoryPath.range(of: "scripts")!
var sourceDirectoryPath = currentDirectoryPath
sourceDirectoryPath.removeSubrange(rangeToRemove)

do {
  
  let yearDirectoryPath = sourceDirectoryPath + "\(year)/"
  try FileManager.default.createDirectory(atPath: yearDirectoryPath, withIntermediateDirectories: false, attributes: nil)
  
  for month in months {
    
    let monthDirectoryPath = yearDirectoryPath + "\(month)/"
    try FileManager.default.createDirectory(atPath: monthDirectoryPath, withIntermediateDirectories: false, attributes: nil)

    let readmeContents = """
	# Nashville CocoaHeads Presentation for \(month) \(year)

	Topic:

	Description:

	Presenter:

	Bio:

	""".data(using: .utf8)!

	let readmePath = monthDirectoryPath + "README.md"
	FileManager.default.createFile(atPath: readmePath, contents: readmeContents, attributes: nil)
  }
}
catch let error {
  print("Some error occurred: \(error.localizedDescription)")
  exit(EXIT_FAILURE)
}

print("Archive directory generation complete for \(year)!")
