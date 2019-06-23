//
//  main.swift
//  Problem 18
//
//  Created by Jaakko Kenttä on 23/06/2019.
//  Copyright © 2019 Jaakko Kenttä. All rights reserved.
//

/*
By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.

				3
			7 		4
		2 		4 		6
	8 		5 		9 		3

That is, 3 + 7 + 4 + 9 = 23.

Find the maximum total from top to bottom of the triangle below:

														75
													95		64
												17 		47 		82
											18 		35 		87 		10
										20 		04 		82 		47 		65
									19 		01 		23 		75 		03 		34
								88 		02 		77 		73 		07 		63 		67
							99 		65 		04 		28 		06 		16 		70 		92
						41 		41 		26 		56 		83 		40 		80 		70		33
					41 		48 		72 		33 		47 		32 		37 		16 		94 		29
				53 		71 		44 		65 		25 		43 		91 		52 		97 		51 		14
			70 		11 		33 		28 		77 		73 		17 		78 		39 		68 		17 		57
		91 		71 		52 		38 		17 		14 		91 		43 		58 		50 		27 		29 		48
	63 		66 		04 		68 		89 		53 		67 		30 		73 		16 		69 		87 		40 		31
04 		62 		98 		27 		23 		09		 70 	98 		73 		93 		38 		53 		60 		04 		23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route. However, Problem 67, is the same challenge with a triangle containing one-hundred rows; it cannot be solved by brute force, and requires a clever method! ;o)
*/

import Foundation


let triangle = """
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
"""



class Node {
	var value: Int
	var children: [Node] = []
	weak var parent: Node?

	init(value: Int) {
		self.value = value
	}

	func add(child: Node) {
		children.append(child)
		child.parent = self
	}
}


extension Node: CustomStringConvertible {
	var description: String {
		var text = "\(value)"
		if !children.isEmpty {
			text += " {" + children.map { $0.description }.joined(separator: ", ") + "} "
		}
		return text
	}
}


// Create array of triangle rows
var triangleArray = triangle
	.components(separatedBy: "\n")
	.map { $0.components(separatedBy: " ")}
	.map { $0.compactMap { Int($0) }}


let mainNode = Node(value: triangleArray.remove(at: 0)[0])
print(mainNode)

var topNodes = [mainNode]

while (triangleArray.count > 0) {

	var level = triangleArray.remove(at: 0)
	print(level)

	var newTopNodes = [Node]()

	for node in topNodes {
		let child1 = Node(value: level.remove(at: 0))
		node.add(child: child1)
		newTopNodes.append(child1)

		let child2 = Node(value: level.remove(at: 0))
		node.add(child: child2)
		newTopNodes.append(child2)
	}

	topNodes = newTopNodes
}

print(mainNode)



/*
let node = Node(value: triangleArray[1].remove(at: 0))
let children1 = Node(value: triangleArray[0].remove(at: 0))
node.add(child: children1)
let children2 = Node(value: triangleArray[0].remove(at: 0))
node.add(child: children2)

print(node)

while triangleArray.count > 0 {
	break
}
*/

