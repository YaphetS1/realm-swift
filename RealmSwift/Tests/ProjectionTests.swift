////////////////////////////////////////////////////////////////////////////
//
// Copyright 2021 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Foundation
import Realm
import RealmSwift
import XCTest

#if canImport(RealmTestSupport)
import RealmTestSupport
import SwiftUI
#endif

/**
 Test objects definitions
 */
enum IntegerEnum: Int, PersistableEnum {
    case value1 = 1
    case value2 = 3
}

class SwiftAllTypesObject: Object {
    @Persisted(primaryKey: true) var pk: String
    @Persisted var boolCol: Bool
    @Persisted var intCol: Int
    @Persisted var int8Col: Int8
    @Persisted var int16Col: Int16
    @Persisted var int32Col: Int32
    @Persisted var int64Col: Int64
    @Persisted var intEnumCol: IntegerEnum
    @Persisted var floatCol: Float
    @Persisted var doubleCol: Double
    @Persisted var stringCol: String
    @Persisted var binaryCol: Data
    @Persisted var dateCol: Date
    @Persisted var decimalCol: Decimal128
    @Persisted var objectIdCol: ObjectId
    @Persisted var objectCol: SwiftBoolObject?
    @Persisted var uuidCol: UUID
    @Persisted var arrayCol: List<SwiftBoolObject>
    @Persisted var setCol: MutableSet<SwiftBoolObject>
    @Persisted var mapCol: Map<String, SwiftBoolObject?>
    @Persisted var relationCol: List<SwiftAllTypesObject>
    @Persisted(originProperty: "relationCol") var backlink: LinkingObjects<SwiftAllTypesObject>

    class func defaultValues() -> [String: Any] {
        return  [
            "pk": UUID().uuidString,
            "boolCol": true,
            "intCol": 123,
            "int8Col": 123 as Int8,
            "int16Col": 123 as Int16,
            "int32Col": 123 as Int32,
            "int64Col": 123 as Int64,
            "floatCol": 1.23 as Float,
            "doubleCol": 12.3,
            "stringCol": "a",
            "binaryCol": "a".data(using: String.Encoding.utf8)!,
            "dateCol": Date(timeIntervalSince1970: 1),
            "decimalCol": Decimal128("123e4"),
            "objectIdCol": ObjectId("1234567890ab1234567890ab"),
            "objectCol": [false],
            "uuidCol": UUID(uuidString: "137decc8-b300-4954-a233-f89909f4fd89")!,
            "arrayCol": [[true]],
            "setCol": [[true]],
            "mapCol": ["true": [true]]
        ]
    }
}

struct AllTypesProjection: Projection {
    typealias Root = ModernAllTypesObject

    init() {
    }

    @Projected(\ModernAllTypesObject.pk) var pk
    @Projected(\ModernAllTypesObject.boolCol) var boolCol
    @Projected(\ModernAllTypesObject.intCol) var intCol
    @Projected(\ModernAllTypesObject.int8Col) var int8Col
    @Projected(\ModernAllTypesObject.int16Col) var int16Col
    @Projected(\ModernAllTypesObject.int32Col) var int32Col
    @Projected(\ModernAllTypesObject.int64Col) var int64Col
    @Projected(\ModernAllTypesObject.floatCol) var floatCol
    @Projected(\ModernAllTypesObject.doubleCol) var doubleCol
    @Projected(\ModernAllTypesObject.stringCol) var stringCol
    @Projected(\ModernAllTypesObject.binaryCol) var binaryCol
    @Projected(\ModernAllTypesObject.dateCol) var dateCol
    @Projected(\ModernAllTypesObject.decimalCol) var decimalCol
    @Projected(\ModernAllTypesObject.objectIdCol) var objectIdCol
    @Projected(\ModernAllTypesObject.objectCol) var objectCol
    @Projected(\ModernAllTypesObject.arrayCol) var arrayCol
    @Projected(\ModernAllTypesObject.setCol) var setCol
    @Projected(\ModernAllTypesObject.anyCol) var anyCol
    @Projected(\ModernAllTypesObject.uuidCol) var uuidCol
    @Projected(\ModernAllTypesObject.intEnumCol) var intEnumCol
    @Projected(\ModernAllTypesObject.stringEnumCol) var stringEnumCol

    @Projected(\ModernAllTypesObject.optIntCol) var optIntCol
    @Projected(\ModernAllTypesObject.optInt8Col) var optInt8Col
    @Projected(\ModernAllTypesObject.optInt16Col) var optInt16Col
    @Projected(\ModernAllTypesObject.optInt32Col) var optInt32Col
    @Projected(\ModernAllTypesObject.optInt64Col) var optInt64Col
    @Projected(\ModernAllTypesObject.optFloatCol) var optFloatCol
    @Projected(\ModernAllTypesObject.optDoubleCol) var optDoubleCol
    @Projected(\ModernAllTypesObject.optBoolCol) var optBoolCol
    @Projected(\ModernAllTypesObject.optStringCol) var optStringCol
    @Projected(\ModernAllTypesObject.optBinaryCol) var optBinaryCol
    @Projected(\ModernAllTypesObject.optDateCol) var optDateCol
    @Projected(\ModernAllTypesObject.optDecimalCol) var optDecimalCol
    @Projected(\ModernAllTypesObject.optObjectIdCol) var optObjectIdCol
    @Projected(\ModernAllTypesObject.optUuidCol) var optUuidCol
    @Projected(\ModernAllTypesObject.optIntEnumCol) var optIntEnumCol
    @Projected(\ModernAllTypesObject.optStringEnumCol) var optStringEnumCol

    @Projected(\ModernAllTypesObject.arrayBool) var arrayBool
    @Projected(\ModernAllTypesObject.arrayInt) var arrayInt
    @Projected(\ModernAllTypesObject.arrayInt8) var arrayInt8
    @Projected(\ModernAllTypesObject.arrayInt16) var arrayInt16
    @Projected(\ModernAllTypesObject.arrayInt32) var arrayInt32
    @Projected(\ModernAllTypesObject.arrayInt64) var arrayInt64
    @Projected(\ModernAllTypesObject.arrayFloat) var arrayFloat
    @Projected(\ModernAllTypesObject.arrayDouble) var arrayDouble
    @Projected(\ModernAllTypesObject.arrayString) var arrayString
    @Projected(\ModernAllTypesObject.arrayBinary) var arrayBinary
    @Projected(\ModernAllTypesObject.arrayDate) var arrayDate
    @Projected(\ModernAllTypesObject.arrayDecimal) var arrayDecimal
    @Projected(\ModernAllTypesObject.arrayObjectId) var arrayObjectId
    @Projected(\ModernAllTypesObject.arrayAny) var arrayAny
    @Projected(\ModernAllTypesObject.arrayUuid) var arrayUuid

    @Projected(\ModernAllTypesObject.arrayOptBool) var arrayOptBool
    @Projected(\ModernAllTypesObject.arrayOptInt) var arrayOptInt
    @Projected(\ModernAllTypesObject.arrayOptInt8) var arrayOptInt8
    @Projected(\ModernAllTypesObject.arrayOptInt16) var arrayOptInt16
    @Projected(\ModernAllTypesObject.arrayOptInt32) var arrayOptInt32
    @Projected(\ModernAllTypesObject.arrayOptInt64) var arrayOptInt64
    @Projected(\ModernAllTypesObject.arrayOptFloat) var arrayOptFloat
    @Projected(\ModernAllTypesObject.arrayOptDouble) var arrayOptDouble
    @Projected(\ModernAllTypesObject.arrayOptString) var arrayOptString
    @Projected(\ModernAllTypesObject.arrayOptBinary) var arrayOptBinary
    @Projected(\ModernAllTypesObject.arrayOptDate) var arrayOptDate
    @Projected(\ModernAllTypesObject.arrayOptDecimal) var arrayOptDecimal
    @Projected(\ModernAllTypesObject.arrayOptObjectId) var arrayOptObjectId
    @Projected(\ModernAllTypesObject.arrayOptUuid) var arrayOptUuid

    @Projected(\ModernAllTypesObject.setBool) var setBool
    @Projected(\ModernAllTypesObject.setInt) var setInt
    @Projected(\ModernAllTypesObject.setInt8) var setInt8
    @Projected(\ModernAllTypesObject.setInt16) var setInt16
    @Projected(\ModernAllTypesObject.setInt32) var setInt32
    @Projected(\ModernAllTypesObject.setInt64) var setInt64
    @Projected(\ModernAllTypesObject.setFloat) var setFloat
    @Projected(\ModernAllTypesObject.setDouble) var setDouble
    @Projected(\ModernAllTypesObject.setString) var setString
    @Projected(\ModernAllTypesObject.setBinary) var setBinary
    @Projected(\ModernAllTypesObject.setDate) var setDate
    @Projected(\ModernAllTypesObject.setDecimal) var setDecimal
    @Projected(\ModernAllTypesObject.setObjectId) var setObjectId
    @Projected(\ModernAllTypesObject.setAny) var setAny
    @Projected(\ModernAllTypesObject.setUuid) var setUuid

    @Projected(\ModernAllTypesObject.setOptBool) var setOptBool
    @Projected(\ModernAllTypesObject.setOptInt) var setOptInt
    @Projected(\ModernAllTypesObject.setOptInt8) var setOptInt8
    @Projected(\ModernAllTypesObject.setOptInt16) var setOptInt16
    @Projected(\ModernAllTypesObject.setOptInt32) var setOptInt32
    @Projected(\ModernAllTypesObject.setOptInt64) var setOptInt64
    @Projected(\ModernAllTypesObject.setOptFloat) var setOptFloat
    @Projected(\ModernAllTypesObject.setOptDouble) var setOptDouble
    @Projected(\ModernAllTypesObject.setOptString) var setOptString
    @Projected(\ModernAllTypesObject.setOptBinary) var setOptBinary
    @Projected(\ModernAllTypesObject.setOptDate) var setOptDate
    @Projected(\ModernAllTypesObject.setOptDecimal) var setOptDecimal
    @Projected(\ModernAllTypesObject.setOptObjectId) var setOptObjectId
    @Projected(\ModernAllTypesObject.setOptUuid) var setOptUuid

    @Projected(\ModernAllTypesObject.mapBool) var mapBool
    @Projected(\ModernAllTypesObject.mapInt) var mapInt
    @Projected(\ModernAllTypesObject.mapInt8) var mapInt8
    @Projected(\ModernAllTypesObject.mapInt16) var mapInt16
    @Projected(\ModernAllTypesObject.mapInt32) var mapInt32
    @Projected(\ModernAllTypesObject.mapInt64) var mapInt64
    @Projected(\ModernAllTypesObject.mapFloat) var mapFloat
    @Projected(\ModernAllTypesObject.mapDouble) var mapDouble
    @Projected(\ModernAllTypesObject.mapString) var mapString
    @Projected(\ModernAllTypesObject.mapBinary) var mapBinary
    @Projected(\ModernAllTypesObject.mapDate) var mapDate
    @Projected(\ModernAllTypesObject.mapDecimal) var mapDecimal
    @Projected(\ModernAllTypesObject.mapObjectId) var mapObjectId
    @Projected(\ModernAllTypesObject.mapAny) var mapAny
    @Projected(\ModernAllTypesObject.mapUuid) var mapUuid

    @Projected(\ModernAllTypesObject.mapOptBool) var mapOptBool
    @Projected(\ModernAllTypesObject.mapOptInt) var mapOptInt
    @Projected(\ModernAllTypesObject.mapOptInt8) var mapOptInt8
    @Projected(\ModernAllTypesObject.mapOptInt16) var mapOptInt16
    @Projected(\ModernAllTypesObject.mapOptInt32) var mapOptInt32
    @Projected(\ModernAllTypesObject.mapOptInt64) var mapOptInt64
    @Projected(\ModernAllTypesObject.mapOptFloat) var mapOptFloat
    @Projected(\ModernAllTypesObject.mapOptDouble) var mapOptDouble
    @Projected(\ModernAllTypesObject.mapOptString) var mapOptString
    @Projected(\ModernAllTypesObject.mapOptBinary) var mapOptBinary
    @Projected(\ModernAllTypesObject.mapOptDate) var mapOptDate
    @Projected(\ModernAllTypesObject.mapOptDecimal) var mapOptDecimal
    @Projected(\ModernAllTypesObject.mapOptObjectId) var mapOptObjectId
    @Projected(\ModernAllTypesObject.mapOptUuid) var mapOptUuid

    @Projected(\ModernAllTypesObject.linkingObjects) var linkingObjects
}

struct FailedProjection: Projection {
    typealias Root = ModernAllTypesObject

    init() {
    }

    @Projected(\ModernAllTypesObject.ignored) var ignored
}

public class Address: EmbeddedObject {
    @Persisted var city: String = ""
    @Persisted var country = ""
}

public class Person: Object {
    @Persisted var firstName: String
    @Persisted var lastName = ""
    @Persisted var birthday: Date
    @Persisted var address: Address? = nil
    @Persisted public var friends = List<Person>()
    @Persisted var reviews = List<String>()
    @Persisted var money: Decimal128
}

public struct AddressProjection: Projection {
    public typealias Root = Address

    public init() {
    }
    
    @Projected(\Address.city) var city
}

public struct PersonProjection: Projection {
    public typealias Root = Person

    public init() {
    }

    @Projected(\Person.firstName) var firstName
    @Projected(\Person.lastName) var lastName
    @Projected(\Person.birthday.timeIntervalSince1970) var birthdayAsEpochtime
    @Projected(\Person.address?.city) var homeCity
    @Projected(\Person.friends.projectTo.firstName) var firstFriendsName: ProjectedList<String>
}

class ProjectionTests: TestCase {

    func assertSetEquals<T: RealmCollectionValue>(_ set: MutableSet<T>, _ expected: Array<T>) {
        XCTAssertEqual(set.count, Set(expected).count)
        XCTAssertEqual(Set(set), Set(expected))
    }

    func assertEquivalent(_ actual: AnyRealmCollection<ModernAllTypesObject>,
                          _ expected: Array<ModernAllTypesObject>,
                          expectedShouldBeCopy: Bool) {
        XCTAssertEqual(actual.count, expected.count)
        for obj in expected {
            if expectedShouldBeCopy {
                XCTAssertTrue(actual.contains { $0.pk == obj.pk })
            } else {
                XCTAssertTrue(actual.contains(obj))
            }
        }
    }

    func assertMapEquals<T: RealmCollectionValue>(_ actual: Map<String, T>, _ expected: Dictionary<String, T>) {
        XCTAssertEqual(actual.count, expected.count)
        for (key, value) in expected {
            XCTAssertEqual(actual[key], value)
        }
    }

    let allTypeValues = [
            "boolCol": true,
            "intCol": 10,
            "int8Col": 11 as Int8,
            "int16Col": 12 as Int16,
            "int32Col": 13 as Int32,
            "int64Col": 14 as Int64,
            "floatCol": 15 as Float,
            "doubleCol": 16 as Double,
            "stringCol": "a",
            "binaryCol": "b".data(using: .utf8)!,
            "dateCol": Date(timeIntervalSince1970: 17),
            "decimalCol": 18 as Decimal128,
            "objectIdCol": ObjectId.generate(),
            "objectCol": ModernAllTypesObject(value: ["intCol": 1]),
            "arrayCol": [
                ModernAllTypesObject(value: ["intCol": 2]),
                ModernAllTypesObject(value: ["intCol": 3])
            ],
            "setCol": [
                ModernAllTypesObject(value: ["intCol": 4]),
                ModernAllTypesObject(value: ["intCol": 5]),
                ModernAllTypesObject(value: ["intCol": 6])
            ],
            "anyCol": AnyRealmValue.int(20),
            "uuidCol": UUID(),
            "intEnumCol": ModernIntEnum.value2,
            "stringEnumCol": ModernStringEnum.value3,

            "optBoolCol": false,
            "optIntCol": 30,
            "optInt8Col": 31 as Int8,
            "optInt16Col": 32 as Int16,
            "optInt32Col": 33 as Int32,
            "optInt64Col": 34 as Int64,
            "optFloatCol": 35 as Float,
            "optDoubleCol": 36 as Double,
            "optStringCol": "c",
            "optBinaryCol": "d".data(using: .utf8)!,
            "optDateCol": Date(timeIntervalSince1970: 37),
            "optDecimalCol": 38 as Decimal128,
            "optObjectIdCol": ObjectId.generate(),
            "optUuidCol": UUID(),
            "optIntEnumCol": ModernIntEnum.value1,
            "optStringEnumCol": ModernStringEnum.value1,

            "arrayBool": [true, false] as [Bool],
            "arrayInt": [1, 1, 2, 3] as [Int],
            "arrayInt8": [1, 2, 3, 1] as [Int8],
            "arrayInt16": [1, 2, 3, 1] as [Int16],
            "arrayInt32": [1, 2, 3, 1] as [Int32],
            "arrayInt64": [1, 2, 3, 1] as [Int64],
            "arrayFloat": [1 as Float, 2 as Float, 3 as Float, 1 as Float],
            "arrayDouble": [1 as Double, 2 as Double, 3 as Double, 1 as Double],
            "arrayString": ["a", "b", "c"] as [String],
            "arrayBinary": ["a".data(using: .utf8)!] as [Data],
            "arrayDate": [Date(timeIntervalSince1970: 0), Date(timeIntervalSince1970: 1)] as [Date],
            "arrayDecimal": [1 as Decimal128, 2 as Decimal128],
            "arrayObjectId": [ObjectId("6058f12b957ba06156586a7c"), ObjectId("6058f12682b2fbb1f334ef1d")],
            "arrayAny": [.none, .int(1), .string("a"), .none] as [AnyRealmValue],
            "arrayUuid": [UUID(uuidString: "6b28ec45-b29a-4b0a-bd6a-343c7f6d90fd")!, UUID(uuidString: "6b28ec45-b29a-4b0a-bd6a-343c7f6d90fe")!],

            "arrayOptBool": [true, false, nil] as [Bool?],
            "arrayOptInt": [1, 1, 2, 3, nil] as [Int?],
            "arrayOptInt8": [1, 2, 3, 1, nil] as [Int8?],
            "arrayOptInt16": [1, 2, 3, 1, nil] as [Int16?],
            "arrayOptInt32": [1, 2, 3, 1, nil] as [Int32?],
            "arrayOptInt64": [1, 2, 3, 1, nil] as [Int64?],
            "arrayOptFloat": [1 as Float, 2 as Float, 3 as Float, 1 as Float, nil],
            "arrayOptDouble": [1 as Double, 2 as Double, 3 as Double, 1 as Double, nil],
            "arrayOptString": ["a", "b", "c", nil],
            "arrayOptBinary": ["a".data(using: .utf8)!, nil],
            "arrayOptDate": [Date(timeIntervalSince1970: 0), Date(timeIntervalSince1970: 1), nil],
            "arrayOptDecimal": [1 as Decimal128, 2 as Decimal128, nil],
            "arrayOptObjectId": [ObjectId("6058f12b957ba06156586a7c"), ObjectId("6058f12682b2fbb1f334ef1d"), nil],
            "arrayOptUuid": [UUID(uuidString: "6b28ec45-b29a-4b0a-bd6a-343c7f6d90fd")!, UUID(uuidString: "6b28ec45-b29a-4b0a-bd6a-343c7f6d90fe")!, nil],

            "setBool": [true] as [Bool],
            "setInt": [1, 1, 2, 3] as [Int],
            "setInt8": [1, 2, 3, 1] as [Int8],
            "setInt16": [1, 2, 3, 1] as [Int16],
            "setInt32": [1, 2, 3, 1] as [Int32],
            "setInt64": [1, 2, 3, 1] as [Int64],
            "setFloat": [1 as Float, 2 as Float, 3 as Float, 1 as Float],
            "setDouble": [1 as Double, 2 as Double, 3 as Double, 1 as Double],
            "setString": ["a", "b", "c"] as [String],
            "setBinary": ["a".data(using: .utf8)!] as [Data],
            "setDate": [Date(), Date()] as [Date],
            "setDecimal": [1 as Decimal128, 2 as Decimal128],
            "setObjectId": [ObjectId.generate(), ObjectId.generate()],
            "setAny": [.none, .int(1), .string("a"), .none] as [AnyRealmValue],
            "setUuid": [UUID(), UUID(), UUID()],

            "setOptBool": [true, false, nil] as [Bool?],
            "setOptInt": [1, 1, 2, 3, nil] as [Int?],
            "setOptInt8": [1, 2, 3, 1, nil] as [Int8?],
            "setOptInt16": [1, 2, 3, 1, nil] as [Int16?],
            "setOptInt32": [1, 2, 3, 1, nil] as [Int32?],
            "setOptInt64": [1, 2, 3, 1, nil] as [Int64?],
            "setOptFloat": [1 as Float, 2 as Float, 3 as Float, 1 as Float, nil],
            "setOptDouble": [1 as Double, 2 as Double, 3 as Double, 1 as Double, nil],
            "setOptString": ["a", "b", "c", nil],
            "setOptBinary": ["a".data(using: .utf8)!, nil],
            "setOptDate": [Date(), Date(), nil],
            "setOptDecimal": [1 as Decimal128, 2 as Decimal128, nil],
            "setOptObjectId": [ObjectId.generate(), ObjectId.generate(), nil],
            "setOptUuid": [UUID(), UUID(), UUID(), nil],

            "mapBool": ["1": true, "2": false] as [String: Bool],
            "mapInt": ["1": 1, "2": 1, "3": 2, "4": 3] as [String: Int],
            "mapInt8": ["1": 1, "2": 2, "3": 3, "4": 1] as [String: Int8],
            "mapInt16": ["1": 1, "2": 2, "3": 3, "4": 1] as [String: Int16],
            "mapInt32": ["1": 1, "2": 2, "3": 3, "4": 1] as [String: Int32],
            "mapInt64": ["1": 1, "2": 2, "3": 3, "4": 1] as [String: Int64],
            "mapFloat": ["1": 1 as Float, "2": 2 as Float, "3": 3 as Float, "4": 1 as Float],
            "mapDouble": ["1": 1 as Double, "2": 2 as Double, "3": 3 as Double, "4": 1 as Double],
            "mapString": ["1": "a", "2": "b", "3": "c"] as [String: String],
            "mapBinary": ["1": "a".data(using: .utf8)!] as [String: Data],
            "mapDate": ["1": Date(), "2": Date()] as [String: Date],
            "mapDecimal": ["1": 1 as Decimal128, "2": 2 as Decimal128],
            "mapObjectId": ["1": ObjectId.generate(), "2": ObjectId.generate()],
            "mapAny": ["1": .none, "2": .int(1), "3": .string("a"), "4": .none] as [String: AnyRealmValue],
            "mapUuid": ["1": UUID(), "2": UUID(), "3": UUID()],

            "mapOptBool": ["1": true, "2": false, "3": nil] as [String: Bool?],
            "mapOptInt": ["1": 1, "2": 1, "3": 2, "4": 3, "5": nil] as [String: Int?],
            "mapOptInt8": ["1": 1, "2": 2, "3": 3, "4": 1, "5": nil] as [String: Int8?],
            "mapOptInt16": ["1": 1, "2": 2, "3": 3, "4": 1, "5": nil] as [String: Int16?],
            "mapOptInt32": ["1": 1, "2": 2, "3": 3, "4": 1, "5": nil] as [String: Int32?],
            "mapOptInt64": ["1": 1, "2": 2, "3": 3, "4": 1, "5": nil] as [String: Int64?],
            "mapOptFloat": ["1": 1 as Float, "2": 2 as Float, "3": 3 as Float, "4": 1 as Float, "5": nil],
            "mapOptDouble": ["1": 1 as Double, "2": 2 as Double, "3": 3 as Double, "4": 1 as Double, "5": nil],
            "mapOptString": ["1": "a", "2": "b", "3": "c", "4": nil],
            "mapOptBinary": ["1": "a".data(using: .utf8)!, "2": nil],
            "mapOptDate": ["1": Date(), "2": Date(), "3": nil],
            "mapOptDecimal": ["1": 1 as Decimal128, "2": 2 as Decimal128, "3": nil],
            "mapOptObjectId": ["1": ObjectId.generate(), "2": ObjectId.generate(), "3": nil],
            "mapOptUuid": ["1": UUID(), "2": UUID(), "3": UUID(), "4": nil],
    ] as [String : Any]

    override func setUp() {
        super.setUp()
        let realm = realmWithTestPath()
        try! realm.write {
            let js = realm.create(Person.self, value: ["firstName": "John",
                                                       "lastName": "Snow",
                                                       "birthday": Date(timeIntervalSince1970: 10),
                                                       "address": ["Winterfell", "Kingdom in the North"],
                                                       "money": Decimal128("2.22")])
            let dt = realm.create(Person.self, value: ["firstName": "Daenerys",
                                                       "lastName": "Targaryen",
                                                       "birthday": Date(timeIntervalSince1970: 0),
                                                       "address": ["King's Landing", "Westeros"],
                                                       "money": Decimal128("2.22")])
            js.friends.append(dt)
            dt.friends.append(js)
            
            let a = realm.create(SwiftAllTypesObject.self, value: SwiftAllTypesObject.defaultValues())
            let b = realm.create(SwiftAllTypesObject.self, value: SwiftAllTypesObject.defaultValues())
            a.relationCol.append(b)
            b.relationCol.append(a)

            realm.create(ModernAllTypesObject.self, value: allTypeValues)
        }
    }

    func testProjectionManualInit() {
        let realm = realmWithTestPath()
        let johnSnow = realm.objects(Person.self).filter("lastName == 'Snow'").first!
        // this step will happen under the hood
        let pp = PersonProjection(johnSnow)
        XCTAssertEqual(pp.homeCity, "Winterfell")
        XCTAssertEqual(pp.birthdayAsEpochtime, Date(timeIntervalSince1970: 10).timeIntervalSince1970)
        XCTAssertEqual(pp.firstFriendsName.first!, "Daenerys")
    }
    
    func testProjectionFromResult() {
        let realm = realmWithTestPath()
        let johnSnow: PersonProjection = realm.objects(PersonProjection.self).first!
        XCTAssertEqual(johnSnow.homeCity, "Winterfell")
        XCTAssertEqual(johnSnow.birthdayAsEpochtime, Date(timeIntervalSince1970: 10).timeIntervalSince1970)
        XCTAssertEqual(johnSnow.firstFriendsName.first!, "Daenerys")
    }
    
    func testProjectionFromResultFiltered() {
        let realm = realmWithTestPath()
        let johnSnow: PersonProjection = realm.objects(PersonProjection.self).filter("lastName == 'Snow'").first!

        XCTAssertEqual(johnSnow.homeCity, "Winterfell")
        XCTAssertEqual(johnSnow.birthdayAsEpochtime, Date(timeIntervalSince1970: 10).timeIntervalSince1970)
        XCTAssertEqual(johnSnow.firstFriendsName.first!, "Daenerys")
    }

    func testProjectionFromResultSorted() {
        let realm = realmWithTestPath()
        let dany: PersonProjection = realm.objects(PersonProjection.self).sorted(byKeyPath: "firstName").first!

        XCTAssertEqual(dany.homeCity, "King's Landing")
        XCTAssertEqual(dany.birthdayAsEpochtime, Date(timeIntervalSince1970: 0).timeIntervalSince1970)
        XCTAssertEqual(dany.firstFriendsName.first!, "John")
    }
    
    func testProjectionEquality() {
        let realm = realmWithTestPath()
        let johnObject = realm.objects(Person.self).filter("lastName == 'Snow'").first!
        let johnDefaultInit = PersonProjection(johnObject)
        let johnMapped = realm.objects(PersonProjection.self).filter("lastName == 'Snow'").first!
        let notJohn = realm.objects(PersonProjection.self).filter("lastName != 'Snow'").first!
        
        XCTAssertEqual(johnMapped, johnDefaultInit)
        XCTAssertNotEqual(johnMapped, notJohn)
    }
    
    func testProjectionsRealmShouldNotBeNil() {
        XCTAssertNotNil(realmWithTestPath().objects(PersonProjection.self).first!.realm)
        XCTAssertNotNil(realmWithTestPath().objects(AddressProjection.self).first!.realm)
    }

    func testProjectionFromResultSortedBirthday() {
        let realm = realmWithTestPath()
//        let dany: PersonProjection = realm.objects(PersonProjection.self).sorted(byKeyPath: "birthdayAsEpochtime").first!
        let dany: PersonProjection = realm.objects(PersonProjection.self).sorted(byKeyPath: "birthday").first!

        XCTAssertEqual(dany.homeCity, "King's Landing")
        XCTAssertEqual(dany.birthdayAsEpochtime, Date(timeIntervalSince1970: 0).timeIntervalSince1970)
        XCTAssertEqual(dany.firstFriendsName.first!, "John")
    }

    func testProjectionForAllRealmTypes() {
        let allTypesModel = realmWithTestPath().objects(AllTypesProjection.self).first!

        XCTAssertEqual(allTypesModel.boolCol, allTypeValues["boolCol"] as! Bool)
        XCTAssertEqual(allTypesModel.intCol, allTypeValues["intCol"] as! Int)
        XCTAssertEqual(allTypesModel.int8Col, allTypeValues["int8Col"] as! Int8)
        XCTAssertEqual(allTypesModel.int16Col, allTypeValues["int16Col"] as! Int16)
        XCTAssertEqual(allTypesModel.int32Col, allTypeValues["int32Col"] as! Int32)
        XCTAssertEqual(allTypesModel.int64Col, allTypeValues["int64Col"] as! Int64)
        XCTAssertEqual(allTypesModel.floatCol, allTypeValues["floatCol"] as! Float)
        XCTAssertEqual(allTypesModel.doubleCol, allTypeValues["doubleCol"] as! Double)
        XCTAssertEqual(allTypesModel.stringCol, allTypeValues["stringCol"] as! String)
        XCTAssertEqual(allTypesModel.binaryCol, allTypeValues["binaryCol"] as! Data)
        XCTAssertEqual(allTypesModel.dateCol, allTypeValues["dateCol"] as! Date)
        XCTAssertEqual(allTypesModel.decimalCol, allTypeValues["decimalCol"] as! Decimal128)
        XCTAssertEqual(allTypesModel.objectIdCol, allTypeValues["objectIdCol"] as! ObjectId)
        XCTAssertEqual(allTypesModel.objectCol!.pk, (allTypeValues["objectCol"] as! ModernAllTypesObject?)!.pk)
        assertEquivalent(AnyRealmCollection(allTypesModel.arrayCol),
                         allTypeValues["arrayCol"] as! [ModernAllTypesObject],
                         expectedShouldBeCopy: true)
        assertEquivalent(AnyRealmCollection(allTypesModel.setCol),
                         allTypeValues["setCol"] as! [ModernAllTypesObject],
                         expectedShouldBeCopy: true)
        XCTAssertEqual(allTypesModel.anyCol, allTypeValues["anyCol"] as! AnyRealmValue)
        XCTAssertEqual(allTypesModel.uuidCol, allTypeValues["uuidCol"] as! UUID)
        XCTAssertEqual(allTypesModel.intEnumCol, allTypeValues["intEnumCol"] as! ModernIntEnum)
        XCTAssertEqual(allTypesModel.stringEnumCol, allTypeValues["stringEnumCol"] as! ModernStringEnum)

        XCTAssertEqual(allTypesModel.optBoolCol, allTypeValues["optBoolCol"] as! Bool?)
        XCTAssertEqual(allTypesModel.optIntCol, allTypeValues["optIntCol"] as! Int?)
        XCTAssertEqual(allTypesModel.optInt8Col, allTypeValues["optInt8Col"] as! Int8?)
        XCTAssertEqual(allTypesModel.optInt16Col, allTypeValues["optInt16Col"] as! Int16?)
        XCTAssertEqual(allTypesModel.optInt32Col, allTypeValues["optInt32Col"] as! Int32?)
        XCTAssertEqual(allTypesModel.optInt64Col, allTypeValues["optInt64Col"] as! Int64?)
        XCTAssertEqual(allTypesModel.optFloatCol, allTypeValues["optFloatCol"] as! Float?)
        XCTAssertEqual(allTypesModel.optDoubleCol, allTypeValues["optDoubleCol"] as! Double?)
        XCTAssertEqual(allTypesModel.optStringCol, allTypeValues["optStringCol"] as! String?)
        XCTAssertEqual(allTypesModel.optBinaryCol, allTypeValues["optBinaryCol"] as! Data?)
        XCTAssertEqual(allTypesModel.optDateCol, allTypeValues["optDateCol"] as! Date?)
        XCTAssertEqual(allTypesModel.optDecimalCol, allTypeValues["optDecimalCol"] as! Decimal128?)
        XCTAssertEqual(allTypesModel.optObjectIdCol, allTypeValues["optObjectIdCol"] as! ObjectId?)
        XCTAssertEqual(allTypesModel.optUuidCol, allTypeValues["optUuidCol"] as! UUID?)
        XCTAssertEqual(allTypesModel.optIntEnumCol, allTypeValues["optIntEnumCol"] as! ModernIntEnum?)
        XCTAssertEqual(allTypesModel.optStringEnumCol, allTypeValues["optStringEnumCol"] as! ModernStringEnum?)

        XCTAssertEqual(Array(allTypesModel.arrayBool), allTypeValues["arrayBool"] as! [Bool])
        XCTAssertEqual(Array(allTypesModel.arrayInt), allTypeValues["arrayInt"] as! [Int])
        XCTAssertEqual(Array(allTypesModel.arrayInt8), allTypeValues["arrayInt8"] as! [Int8])
        XCTAssertEqual(Array(allTypesModel.arrayInt16), allTypeValues["arrayInt16"] as! [Int16])
        XCTAssertEqual(Array(allTypesModel.arrayInt32), allTypeValues["arrayInt32"] as! [Int32])
        XCTAssertEqual(Array(allTypesModel.arrayInt64), allTypeValues["arrayInt64"] as! [Int64])
        XCTAssertEqual(Array(allTypesModel.arrayFloat), allTypeValues["arrayFloat"] as! [Float])
        XCTAssertEqual(Array(allTypesModel.arrayDouble), allTypeValues["arrayDouble"] as! [Double])
        XCTAssertEqual(Array(allTypesModel.arrayString), allTypeValues["arrayString"] as! [String])
        XCTAssertEqual(Array(allTypesModel.arrayBinary), allTypeValues["arrayBinary"] as! [Data])
        XCTAssertEqual(Array(allTypesModel.arrayDate), allTypeValues["arrayDate"] as! [Date])
        XCTAssertEqual(Array(allTypesModel.arrayDecimal), allTypeValues["arrayDecimal"] as! [Decimal128])
        XCTAssertEqual(Array(allTypesModel.arrayObjectId), allTypeValues["arrayObjectId"] as! [ObjectId])
        XCTAssertEqual(Array(allTypesModel.arrayAny), allTypeValues["arrayAny"] as! [AnyRealmValue])
        XCTAssertEqual(Array(allTypesModel.arrayUuid), allTypeValues["arrayUuid"] as! [UUID])

        XCTAssertEqual(Array(allTypesModel.arrayOptBool), allTypeValues["arrayOptBool"] as! [Bool?])
        XCTAssertEqual(Array(allTypesModel.arrayOptInt), allTypeValues["arrayOptInt"] as! [Int?])
        XCTAssertEqual(Array(allTypesModel.arrayOptInt8), allTypeValues["arrayOptInt8"] as! [Int8?])
        XCTAssertEqual(Array(allTypesModel.arrayOptInt16), allTypeValues["arrayOptInt16"] as! [Int16?])
        XCTAssertEqual(Array(allTypesModel.arrayOptInt32), allTypeValues["arrayOptInt32"] as! [Int32?])
        XCTAssertEqual(Array(allTypesModel.arrayOptInt64), allTypeValues["arrayOptInt64"] as! [Int64?])
        XCTAssertEqual(Array(allTypesModel.arrayOptFloat), allTypeValues["arrayOptFloat"] as! [Float?])
        XCTAssertEqual(Array(allTypesModel.arrayOptDouble), allTypeValues["arrayOptDouble"] as! [Double?])
        XCTAssertEqual(Array(allTypesModel.arrayOptString), allTypeValues["arrayOptString"] as! [String?])
        XCTAssertEqual(Array(allTypesModel.arrayOptBinary), allTypeValues["arrayOptBinary"] as! [Data?])
        XCTAssertEqual(Array(allTypesModel.arrayOptDate), allTypeValues["arrayOptDate"] as! [Date?])
        XCTAssertEqual(Array(allTypesModel.arrayOptDecimal), allTypeValues["arrayOptDecimal"] as! [Decimal128?])
        XCTAssertEqual(Array(allTypesModel.arrayOptObjectId), allTypeValues["arrayOptObjectId"] as! [ObjectId?])
        XCTAssertEqual(Array(allTypesModel.arrayOptUuid), allTypeValues["arrayOptUuid"] as! [UUID?])

        assertSetEquals(allTypesModel.setBool, allTypeValues["setBool"] as! [Bool])
        assertSetEquals(allTypesModel.setInt, allTypeValues["setInt"] as! [Int])
        assertSetEquals(allTypesModel.setInt8, allTypeValues["setInt8"] as! [Int8])
        assertSetEquals(allTypesModel.setInt16, allTypeValues["setInt16"] as! [Int16])
        assertSetEquals(allTypesModel.setInt32, allTypeValues["setInt32"] as! [Int32])
        assertSetEquals(allTypesModel.setInt64, allTypeValues["setInt64"] as! [Int64])
        assertSetEquals(allTypesModel.setFloat, allTypeValues["setFloat"] as! [Float])
        assertSetEquals(allTypesModel.setDouble, allTypeValues["setDouble"] as! [Double])
        assertSetEquals(allTypesModel.setString, allTypeValues["setString"] as! [String])
        assertSetEquals(allTypesModel.setBinary, allTypeValues["setBinary"] as! [Data])
        assertSetEquals(allTypesModel.setDate, allTypeValues["setDate"] as! [Date])
        assertSetEquals(allTypesModel.setDecimal, allTypeValues["setDecimal"] as! [Decimal128])
        assertSetEquals(allTypesModel.setObjectId, allTypeValues["setObjectId"] as! [ObjectId])
        assertSetEquals(allTypesModel.setAny, allTypeValues["setAny"] as! [AnyRealmValue])
        assertSetEquals(allTypesModel.setUuid, allTypeValues["setUuid"] as! [UUID])

        assertSetEquals(allTypesModel.setOptBool, allTypeValues["setOptBool"] as! [Bool?])
        assertSetEquals(allTypesModel.setOptInt, allTypeValues["setOptInt"] as! [Int?])
        assertSetEquals(allTypesModel.setOptInt8, allTypeValues["setOptInt8"] as! [Int8?])
        assertSetEquals(allTypesModel.setOptInt16, allTypeValues["setOptInt16"] as! [Int16?])
        assertSetEquals(allTypesModel.setOptInt32, allTypeValues["setOptInt32"] as! [Int32?])
        assertSetEquals(allTypesModel.setOptInt64, allTypeValues["setOptInt64"] as! [Int64?])
        assertSetEquals(allTypesModel.setOptFloat, allTypeValues["setOptFloat"] as! [Float?])
        assertSetEquals(allTypesModel.setOptDouble, allTypeValues["setOptDouble"] as! [Double?])
        assertSetEquals(allTypesModel.setOptString, allTypeValues["setOptString"] as! [String?])
        assertSetEquals(allTypesModel.setOptBinary, allTypeValues["setOptBinary"] as! [Data?])
        assertSetEquals(allTypesModel.setOptDate, allTypeValues["setOptDate"] as! [Date?])
        assertSetEquals(allTypesModel.setOptDecimal, allTypeValues["setOptDecimal"] as! [Decimal128?])
        assertSetEquals(allTypesModel.setOptObjectId, allTypeValues["setOptObjectId"] as! [ObjectId?])
        assertSetEquals(allTypesModel.setOptUuid, allTypeValues["setOptUuid"] as! [UUID?])

        assertMapEquals(allTypesModel.mapBool, allTypeValues["mapBool"] as! [String: Bool])
        assertMapEquals(allTypesModel.mapInt, allTypeValues["mapInt"] as! [String: Int])
        assertMapEquals(allTypesModel.mapInt8, allTypeValues["mapInt8"] as! [String: Int8])
        assertMapEquals(allTypesModel.mapInt16, allTypeValues["mapInt16"] as! [String: Int16])
        assertMapEquals(allTypesModel.mapInt32, allTypeValues["mapInt32"] as! [String: Int32])
        assertMapEquals(allTypesModel.mapInt64, allTypeValues["mapInt64"] as! [String: Int64])
        assertMapEquals(allTypesModel.mapFloat, allTypeValues["mapFloat"] as! [String: Float])
        assertMapEquals(allTypesModel.mapDouble, allTypeValues["mapDouble"] as! [String: Double])
        assertMapEquals(allTypesModel.mapString, allTypeValues["mapString"] as! [String: String])
        assertMapEquals(allTypesModel.mapBinary, allTypeValues["mapBinary"] as! [String: Data])
        assertMapEquals(allTypesModel.mapDate, allTypeValues["mapDate"] as! [String: Date])
        assertMapEquals(allTypesModel.mapDecimal, allTypeValues["mapDecimal"] as! [String: Decimal128])
        assertMapEquals(allTypesModel.mapObjectId, allTypeValues["mapObjectId"] as! [String: ObjectId])
        assertMapEquals(allTypesModel.mapAny, allTypeValues["mapAny"] as! [String: AnyRealmValue])
        assertMapEquals(allTypesModel.mapUuid, allTypeValues["mapUuid"] as! [String: UUID])

        assertMapEquals(allTypesModel.mapOptBool, allTypeValues["mapOptBool"] as! [String: Bool?])
        assertMapEquals(allTypesModel.mapOptInt, allTypeValues["mapOptInt"] as! [String: Int?])
        assertMapEquals(allTypesModel.mapOptInt8, allTypeValues["mapOptInt8"] as! [String: Int8?])
        assertMapEquals(allTypesModel.mapOptInt16, allTypeValues["mapOptInt16"] as! [String: Int16?])
        assertMapEquals(allTypesModel.mapOptInt32, allTypeValues["mapOptInt32"] as! [String: Int32?])
        assertMapEquals(allTypesModel.mapOptInt64, allTypeValues["mapOptInt64"] as! [String: Int64?])
        assertMapEquals(allTypesModel.mapOptFloat, allTypeValues["mapOptFloat"] as! [String: Float?])
        assertMapEquals(allTypesModel.mapOptDouble, allTypeValues["mapOptDouble"] as! [String: Double?])
        assertMapEquals(allTypesModel.mapOptString, allTypeValues["mapOptString"] as! [String: String?])
        assertMapEquals(allTypesModel.mapOptBinary, allTypeValues["mapOptBinary"] as! [String: Data?])
        assertMapEquals(allTypesModel.mapOptDate, allTypeValues["mapOptDate"] as! [String: Date?])
        assertMapEquals(allTypesModel.mapOptDecimal, allTypeValues["mapOptDecimal"] as! [String: Decimal128?])
        assertMapEquals(allTypesModel.mapOptObjectId, allTypeValues["mapOptObjectId"] as! [String: ObjectId?])
        assertMapEquals(allTypesModel.mapOptUuid, allTypeValues["mapOptUuid"] as! [String: UUID?])
    }
    
    func observeKeyPathChange<P: Projection, E: Equatable>(_ obj: Object, _ obs: P, _ keyPath: PartialKeyPath<P>,
                                             _ old: E?, _ new: E?,
                                             fileName: StaticString = #file, lineNumber: UInt = #line,_ block: () -> Void) {
        let ex = expectation(description: "observeKeyPathChange")
        let token = obs.observe(keyPaths: [keyPath]) { changes in
            ex.fulfill()
            if case .change(let object, let properties) = changes {
                XCTAssertEqual(properties.count, 1)

                let actualOld = properties[0].oldValue as? E
                let actualNew = properties[0].newValue as? E
                
                XCTAssert(actualOld != actualNew, "Old value \(String(describing: actualOld)) should not be equal to New value \(String(describing: actualNew))",
                          file: (fileName), line: lineNumber)
                XCTAssert(new == actualNew,
                          "New value: expected \(String(describing: new)), got \(String(describing: actualNew))",
                          file: (fileName), line: lineNumber)
                if actualOld != nil {
                    XCTAssert(old == actualOld,
                              "Old value: expected \(String(describing: old)), got \(String(describing: actualOld))",
                              file: (fileName), line: lineNumber)
                }
            } else {
                XCTFail("Expected .change but got \(changes)")
            }
        }
        
        try! obj.realm!.write {
            block()
        }
        waitForExpectations(timeout: 2, handler: nil)
        token.invalidate()
    }
    
    func observeArrayKeyPathChange<P: Projection, E: Equatable & RealmCollectionValue>(_ obj: Object, _ obs: P, _ keyPath: PartialKeyPath<P>,
                                                                _ new: [E]?,
                                                                fileName: StaticString = #file, lineNumber: UInt = #line,_ block: () -> Void) {
        let ex = expectation(description: "observeKeyPathChange")
        let token = obs.observe(keyPaths: [keyPath]) { changes in
            ex.fulfill()
            if case .change(let object, let properties) = changes {
                print(changes)
                XCTAssertEqual(properties.count, 1)
                let observedOld = properties[0].oldValue as? [E]
                let observedNew = properties[0].newValue as? [E]
                XCTAssertNil(observedOld)
                XCTAssertNil(observedNew)

                guard let projectedNew = object[keyPath: keyPath] as? List<E>,
                      let new = new else {
                          XCTFail("Expected new array to be [\(String(describing: E.self))] and projected array to be \(String(describing: List<E>.self)), got \(String(describing: new)) and \(String(describing: obs[keyPath: keyPath]))",
                                  file: (fileName), line: lineNumber)
                          return
                      }

                if projectedNew.count != new.count {
                    XCTAssertEqual(projectedNew.count, new.count, "Expected \(projectedNew) and \(new) to be equal", file: (fileName), line: lineNumber)
                }
                else {
                    for (index, element) in projectedNew.enumerated() {
                        XCTAssertEqual(element, new[index], "Element \(element) at index \(index) should be equal to \(new[index])", file: (fileName), line: lineNumber)
                    }
                }
            } else {
                XCTFail("Expected .change but got \(changes)", file: (fileName), line: lineNumber)
            }
        }
        
        try! obj.realm!.write {
            block()
        }
        waitForExpectations(timeout: 2, handler: nil)
        token.invalidate()
    }

    func observeSetKeyPathChange<P: Projection, E: Equatable & RealmCollectionValue>(_ obj: Object, _ obs: P, _ keyPath: PartialKeyPath<P>,
                                                                                     _ new: [E],
                                                                                     fileName: StaticString = #file, lineNumber: UInt = #line,_ block: () -> Void) {
        let ex = expectation(description: "observeKeyPathChange")
        let token = obs.observe(keyPaths: [keyPath]) { changes in
            ex.fulfill()
            if case .change(let object, let properties) = changes {
                print(changes)
                XCTAssertEqual(properties.count, 1)
                let observedOld = properties[0].oldValue as? Set<E>
                let observedNew = properties[0].newValue as? Set<E>
                XCTAssertNil(observedOld)
                XCTAssertNil(observedNew)
                
                guard let projectedNew = object[keyPath: keyPath] as? MutableSet<E> else {
                          XCTFail("Expected new set to be \(String(describing: Set<E>.self)) and projected set to be \(String(describing: MutableSet<E>.self)), got \(String(describing: new)) and \(String(describing: obs[keyPath: keyPath]))",
                                  file: (fileName), line: lineNumber)
                          return
                      }
                
                self.assertSetEquals(projectedNew, new)
            } else {
                XCTFail("Expected .change but got \(changes)", file: (fileName), line: lineNumber)
            }
        }
        
        try! obj.realm!.write {
            block()
        }
        waitForExpectations(timeout: 2, handler: nil)
        token.invalidate()
    }
    
    func observeMapKeyPathChange<P: Projection, E: Equatable & RealmCollectionValue>(_ obj: Object, _ obs: P, _ keyPath: PartialKeyPath<P>,
                                                                                     _ new: Dictionary<String, E>,
                                                                                     fileName: StaticString = #file, lineNumber: UInt = #line,_ block: () -> Void) {
        XCTFail("Work in progress")
//        let new: Set<E> = Set(new.map { $0 })
//        let ex = expectation(description: "observeKeyPathChange")
//        let token = obs.observe(keyPaths: [keyPath]) { changes in
//            ex.fulfill()
//            if case .change(let object, let properties) = changes {
//                print(changes)
//                XCTAssertEqual(properties.count, 1)
//                let observedOld = properties[0].oldValue as? Set<E>
//                let observedNew = properties[0].newValue as? Set<E>
//                XCTAssertNil(observedOld)
//                XCTAssertNil(observedNew)
//
//                guard let projectedNew = object[keyPath: keyPath] as? MutableSet<E> else {
//                          XCTFail("Expected new set to be \(String(describing: Set<E>.self)) and projected set to be \(String(describing: MutableSet<E>.self)), got \(String(describing: new)) and \(String(describing: obs[keyPath: keyPath]))",
//                                  file: (fileName), line: lineNumber)
//                          return
//                      }
//        assertMapEquals(new, projectedNew)
//                if projectedNew.count != new.count {
//                    XCTAssertEqual(projectedNew.count, new.count, "Expected \(projectedNew) and \(new) to be equal", file: (fileName), line: lineNumber)
//                }
//                else {
//                    for (_, element) in new.enumerated() {
//                        XCTAssertTrue(projectedNew.contains(element), "Projected set should contain \(element)", file: (fileName), line: lineNumber)
//                    }
//                }
//            } else {
//                XCTFail("Expected .change but got \(changes)", file: (fileName), line: lineNumber)
//            }
//        }
//
//        try! obj.realm!.write {
//            block()
//        }
//        waitForExpectations(timeout: 2, handler: nil)
//        token.invalidate()
    }
    
    func testAllPropertyTypesNotifications() {
        let realm = realmWithTestPath()
        let obj = realm.objects(ModernAllTypesObject.self).first!
        let obs = realm.objects(AllTypesProjection.self).first!

        let data = "b".data(using: String.Encoding.utf8)!
        let date = Date(timeIntervalSince1970: 2)
        let decimal = Decimal128(number: 3)
        let objectId = ObjectId()
        let uuid = UUID()
        let object = ModernAllTypesObject(value: ["intCol": 2])
        let anyValue = AnyRealmValue.int(22)
        let array: Array<ModernAllTypesObject> = [object] as Array
        let set: Set<ModernAllTypesObject> = [object] as Set

        observeKeyPathChange(obj, obs, \AllTypesProjection.boolCol, obj.boolCol, false, { obj.boolCol = false })
        observeKeyPathChange(obj, obs, \AllTypesProjection.intCol, obj.intCol, 2, { obj.intCol = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.int8Col, obj.int8Col, 2, { obj.int8Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.int16Col, obj.int16Col, 2, { obj.int16Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.int32Col, obj.int32Col, 2, { obj.int32Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.int64Col, obj.int64Col, 2, { obj.int64Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.floatCol, obj.floatCol, 2.0, { obj.floatCol = 2.0 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.doubleCol, obj.doubleCol, 2.0, { obj.doubleCol = 2.0 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.stringCol, obj.stringCol, "def", { obj.stringCol = "def" })
        observeKeyPathChange(obj, obs, \AllTypesProjection.binaryCol, obj.binaryCol, data, { obj.binaryCol = data })
        observeKeyPathChange(obj, obs, \AllTypesProjection.dateCol, obj.dateCol, date, { obj.dateCol = date })
        observeKeyPathChange(obj, obs, \AllTypesProjection.decimalCol, obj.decimalCol, decimal, { obj.decimalCol = decimal })
        observeKeyPathChange(obj, obs, \AllTypesProjection.objectIdCol, obj.objectIdCol, objectId, { obj.objectIdCol = objectId })
        observeKeyPathChange(obj, obs, \AllTypesProjection.objectCol, obj.objectCol, object, { obj.objectCol = object })
//        observeKeyPathChange(obj, obs, \AllTypesProjection.arrayCol, obj.arrayCol, array, { obj.arrayCol = array })
//        observeKeyPathChange(obj, obs, \AllTypesProjection.setCol, obj.setCol, set, { obj.setCol = set })
        observeKeyPathChange(obj, obs, \AllTypesProjection.anyCol, obj.anyCol, anyValue, { obj.anyCol = anyValue })
        observeKeyPathChange(obj, obs, \AllTypesProjection.uuidCol, obj.uuidCol, uuid, { obj.uuidCol = uuid })
        observeKeyPathChange(obj, obs, \AllTypesProjection.intEnumCol, obj.intEnumCol, .value2, { obj.intEnumCol = .value2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.stringEnumCol, obj.stringEnumCol, .value2, { obj.stringEnumCol = .value2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optIntCol, obj.optIntCol, 2, { obj.optIntCol = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optInt8Col, obj.optInt8Col, 2, { obj.optInt8Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optInt16Col, obj.optInt16Col, 2, { obj.optInt16Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optInt32Col, obj.optInt32Col, 2, { obj.optInt32Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optInt64Col, obj.optInt64Col, 2, { obj.optInt64Col = 2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optFloatCol, obj.optFloatCol, 2.0, { obj.optFloatCol = 2.0 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optDoubleCol, obj.optDoubleCol, 2.0, { obj.optDoubleCol = 2.0 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optBoolCol, obj.optBoolCol, false, { obj.optBoolCol = false })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optStringCol, obj.optStringCol, "def", { obj.optStringCol = "def" })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optBinaryCol, obj.optBinaryCol, data, { obj.optBinaryCol = data })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optDateCol, obj.optDateCol, date, { obj.optDateCol = date })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optDecimalCol, obj.optDecimalCol, decimal, { obj.optDecimalCol = decimal })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optObjectIdCol, obj.optObjectIdCol, objectId, { obj.optObjectIdCol = objectId })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optUuidCol, obj.optUuidCol, uuid, { obj.optUuidCol = uuid })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optIntEnumCol, obj.optIntEnumCol, .value2, { obj.optIntEnumCol = .value2 })
        observeKeyPathChange(obj, obs, \AllTypesProjection.optStringEnumCol, obj.optStringEnumCol, .value2, { obj.optStringEnumCol = .value2 })

        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayBool, allTypeValues["arrayBool"] as! [Bool] + [false]) { obj.arrayBool.append(false) }
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayInt, allTypeValues["arrayInt"] as! [Int] + [4], { obj.arrayInt.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayInt8, allTypeValues["arrayInt8"] as! [Int8] + [4], { obj.arrayInt8.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayInt16, allTypeValues["arrayInt16"] as! [Int16] + [4], { obj.arrayInt16.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayInt32, allTypeValues["arrayInt32"] as! [Int32] + [4], { obj.arrayInt32.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayInt64, allTypeValues["arrayInt64"] as! [Int64] + [4], { obj.arrayInt64.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayFloat, allTypeValues["arrayFloat"] as! [Float] + [4], { obj.arrayFloat.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayDouble, allTypeValues["arrayDouble"] as! [Double] + [4], { obj.arrayDouble.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayString, allTypeValues["arrayString"] as! [String] + ["d"], { obj.arrayString.append("d") })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayBinary, allTypeValues["arrayBinary"] as! [Data] + [data], { obj.arrayBinary.append(data) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayDate, allTypeValues["arrayDate"] as! [Date] + [date], { obj.arrayDate.append(date) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayDecimal, allTypeValues["arrayDecimal"] as! [Decimal128] + [decimal], { obj.arrayDecimal.append(decimal) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayObjectId, allTypeValues["arrayObjectId"] as! [ObjectId] + [objectId], { obj.arrayObjectId.append(objectId) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayAny, allTypeValues["arrayAny"] as! [AnyRealmValue] + [anyValue], { obj.arrayAny.append(anyValue) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayUuid, allTypeValues["arrayUuid"] as! [UUID] + [uuid], { obj.arrayUuid.append(uuid) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptBool, allTypeValues["arrayOptBool"] as! [Bool?] + [true], { obj.arrayOptBool.append(true) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptInt, allTypeValues["arrayOptInt"] as! [Int?] + [4], { obj.arrayOptInt.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptInt8, allTypeValues["arrayOptInt8"] as! [Int8?] + [4], { obj.arrayOptInt8.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptInt16, allTypeValues["arrayOptInt16"] as! [Int16?] + [4], { obj.arrayOptInt16.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptInt32, allTypeValues["arrayOptInt32"] as! [Int32?] + [4], { obj.arrayOptInt32.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptInt64, allTypeValues["arrayOptInt64"] as! [Int64?] + [4], { obj.arrayOptInt64.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptFloat, allTypeValues["arrayOptFloat"] as! [Float?] + [4], { obj.arrayOptFloat.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptDouble, allTypeValues["arrayOptDouble"] as! [Double?] + [4], { obj.arrayOptDouble.append(4) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptString, allTypeValues["arrayOptString"] as! [String?] + ["d"], { obj.arrayOptString.append("d") })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptBinary, allTypeValues["arrayOptBinary"] as! [Data?] + [data], { obj.arrayOptBinary.append(data) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptDate, allTypeValues["arrayOptDate"] as! [Date?] + [date], { obj.arrayOptDate.append(date) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptDecimal, allTypeValues["arrayOptDecimal"] as! [Decimal128?] + [decimal], { obj.arrayOptDecimal.append(decimal) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptObjectId, allTypeValues["arrayOptObjectId"] as! [ObjectId?] + [objectId], { obj.arrayOptObjectId.append(objectId) })
        observeArrayKeyPathChange(obj, obs, \AllTypesProjection.arrayOptUuid, allTypeValues["arrayOptUuid"] as! [UUID?] + [uuid], { obj.arrayOptUuid.append(uuid) })

        try! realmWithTestPath().write {
            obj.setBool.removeAll()
            obj.setBool.insert(objectsIn: [true])
            obj.setOptBool.removeAll()
            obj.setOptBool.insert(objectsIn: [true, nil])
        }

        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setBool, allTypeValues["setBool"] as! [Bool] + [false], { obj.setBool.insert(false) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setInt, allTypeValues["setInt"] as! [Int] + [4], { obj.setInt.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setInt8, allTypeValues["setInt8"] as! [Int8] + [4], { obj.setInt8.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setInt16, allTypeValues["setInt16"] as! [Int16] + [4], { obj.setInt16.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setInt32, allTypeValues["setInt32"] as! [Int32] + [4], { obj.setInt32.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setInt64, allTypeValues["setInt64"] as! [Int64] + [4], { obj.setInt64.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setFloat, allTypeValues["setFloat"] as! [Float] + [4], { obj.setFloat.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setDouble, allTypeValues["setDouble"] as! [Double] + [4], { obj.setDouble.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setString, allTypeValues["setString"] as! [String] + ["d"], { obj.setString.insert("d") })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setBinary, allTypeValues["setBinary"] as! [Data] + [data], { obj.setBinary.insert(data) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setDate, allTypeValues["setDate"] as! [Date] + [date], { obj.setDate.insert(date) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setDecimal, allTypeValues["setDecimal"] as! [Decimal128] + [decimal], { obj.setDecimal.insert(decimal) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setObjectId, allTypeValues["setObjectId"] as! [ObjectId] + [objectId], { obj.setObjectId.insert(objectId) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setAny, allTypeValues["setAny"] as! [AnyRealmValue] + [anyValue], { obj.setAny.insert(anyValue) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setUuid, allTypeValues["setUuid"] as! [UUID] + [uuid], { obj.setUuid.insert(uuid) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptBool, allTypeValues["setOptBool"] as! [Bool?] + [false], { obj.setOptBool.insert(false) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptInt, allTypeValues["setOptInt"] as! [Int?] + [4], { obj.setOptInt.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptInt8, allTypeValues["setOptInt8"] as! [Int8?] + [4], { obj.setOptInt8.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptInt16, allTypeValues["setOptInt16"] as! [Int16?] + [4], { obj.setOptInt16.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptInt32, allTypeValues["setOptInt32"] as! [Int32?] + [4], { obj.setOptInt32.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptInt64, allTypeValues["setOptInt64"] as! [Int64?] + [4], { obj.setOptInt64.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptFloat, allTypeValues["setOptFloat"] as! [Float?] + [4], { obj.setOptFloat.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptDouble, allTypeValues["setOptDouble"] as! [Double?] + [4], { obj.setOptDouble.insert(4) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptString, allTypeValues["setOptString"] as! [String?] + ["d"], { obj.setOptString.insert("d") })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptBinary, allTypeValues["setOptBinary"] as! [Data?] + [data], { obj.setOptBinary.insert(data) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptDate, allTypeValues["setOptDate"] as! [Date?] + [date], { obj.setOptDate.insert(date) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptDecimal, allTypeValues["setOptDecimal"] as! [Decimal128?] + [decimal], { obj.setOptDecimal.insert(decimal) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptObjectId, allTypeValues["setOptObjectId"] as! [ObjectId?] + [objectId], { obj.setOptObjectId.insert(objectId) })
        observeSetKeyPathChange(obj, obs, \AllTypesProjection.setOptUuid, allTypeValues["setOptUuid"] as! [UUID?] + [uuid], { obj.setOptUuid.insert(uuid) })

        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapBool, allTypeValues["mapBool"] as! Dictionary<String, Bool>, { obj.mapBool["key"] = false })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapInt, allTypeValues["mapInt"] as! Dictionary<String, Int>, { obj.mapInt["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapInt8, allTypeValues["mapInt8"] as! Dictionary<String, Int8>, { obj.mapInt8["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapInt16, allTypeValues["mapInt16"] as! Dictionary<String, Int16>, { obj.mapInt16["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapInt32, allTypeValues["mapInt32"] as! Dictionary<String, Int32>, { obj.mapInt32["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapInt64, allTypeValues["mapInt64"] as! Dictionary<String, Int64>, { obj.mapInt64["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapFloat, allTypeValues["mapFloat"] as! Dictionary<String, Float>, { obj.mapFloat["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapDouble, allTypeValues["mapDouble"] as! Dictionary<String, Double>, { obj.mapDouble["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapString, allTypeValues["mapString"] as! Dictionary<String, String>, { obj.mapString["key"] = "d" })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapBinary, allTypeValues["mapBinary"] as! Dictionary<String, Data>, { obj.mapBinary["key"] = data })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapDate, allTypeValues["mapDate"] as! Dictionary<String, Date>, { obj.mapDate["key"] = date })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapDecimal, allTypeValues["mapDecimal"] as! Dictionary<String, Decimal128>, { obj.mapDecimal["key"] = decimal })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapObjectId, allTypeValues["mapObjectId"] as! Dictionary<String, ObjectId>, { obj.mapObjectId["key"] = objectId })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapAny, allTypeValues["mapAny"] as! Dictionary<String, AnyRealmValue>, { obj.mapAny["key"] = anyValue })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapUuid, allTypeValues["mapUuid"] as! Dictionary<String, UUID>, { obj.mapUuid["key"] = uuid })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptBool, allTypeValues["mapOptBool"] as! Dictionary<String, Bool?>, { obj.mapOptBool["key"] = false })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptInt, allTypeValues["mapOptInt"] as! Dictionary<String, Int?>, { obj.mapOptInt["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptInt8, allTypeValues["mapOptInt8"] as! Dictionary<String, Int8?>, { obj.mapOptInt8["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptInt16, allTypeValues["mapOptInt16"] as! Dictionary<String, Int16?>, { obj.mapOptInt16["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptInt32, allTypeValues["mapOptInt32"] as! Dictionary<String, Int32?>, { obj.mapOptInt32["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptInt64, allTypeValues["mapOptInt64"] as! Dictionary<String, Int64?>, { obj.mapOptInt64["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptFloat, allTypeValues["mapOptFloat"] as! Dictionary<String, Float?>, { obj.mapOptFloat["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptDouble, allTypeValues["mapOptDouble"] as! Dictionary<String, Double?>, { obj.mapOptDouble["key"] = 4 })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptString, allTypeValues["mapOptString"] as! Dictionary<String, String?>, { obj.mapOptString["key"] = "d" })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptBinary, allTypeValues["mapOptBinary"] as! Dictionary<String, Data?>, { obj.mapOptBinary["key"] = data })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptDate, allTypeValues["mapOptDate"] as! Dictionary<String, Date?>, { obj.mapOptDate["key"] = date })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptDecimal, allTypeValues["mapOptDecimal"] as! Dictionary<String, Decimal128?>, { obj.mapOptDecimal["key"] = decimal })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptObjectId, allTypeValues["mapOptObjectId"] as! Dictionary<String, ObjectId?>, { obj.mapOptObjectId["key"] = objectId })
        observeMapKeyPathChange(obj, obs, \AllTypesProjection.mapOptUuid, allTypeValues["mapOptUuid"] as! Dictionary<String, UUID?>, { obj.mapOptUuid["key"] = uuid })

//        observeKeyPathChange(obj, obs, \AllTypesProjection.linkingObjects, oldObjectId, objectId, { obj.linkingObjects = objectId })

//        observeChange(obj, obs, "propertyNotExist", false, true) { XCTFail() }
//        observeChange(obj, obs, "objectIdCol", obj.objectIdCol, objectId) {
//            ex.fulfill()
//            try! realmWithTestPath().write {
//                obj.objectIdCol = objectId
//            }
//        }
    }

    func testObserveKeyPath() {
        let realm = realmWithTestPath()
        let johnProjection = realm.objects(PersonProjection.self).filter("lastName == 'Snow'").first!

        var ex = expectation(description: "testProjectionNotificationSentInitially")
//        let token = johnProjection.observe(keyPaths: ["lastName"]) { change in
//            print(change)
//            ex.fulfill()
//        }
        waitForExpectations(timeout: 1, handler: nil)

        // Expect notification on lastName key path when it is
        ex = expectation(description: "testProjectionNotificationSentOnChange")
        dispatchSyncNewThread {
            let realm = self.realmWithTestPath()
            try! realm.write {
                let johnObject = realm.objects(Person.self).filter("lastName == 'Snow'").first!
                johnObject.lastName = "Targaryen"
            }
        }
        waitForExpectations(timeout: 1, handler: nil)
//        token.invalidate()
    }
    
    // MARK: Frozen Objects

    func simpleProjection() -> SimpleProjection {
        let realm = realmWithTestPath()
        try! realm.write {
            realm.create(SimpleObject.self)
        }
        return realm.objects(SimpleProjection.self).first!
    }

    func testIsFrozen() {
        let projection = simpleProjection()
        let frozen = projection.freeze()
        XCTAssertFalse(projection.isFrozen)
        XCTAssertTrue(frozen.isFrozen)
    }

    func testFreezingFrozenObjectReturnsSelf() {
        let projection = simpleProjection()
        let frozen = projection.freeze()
        XCTAssertNotEqual(projection, frozen)
        XCTAssertNotEqual(projection.freeze(), frozen)
        XCTAssertEqual(frozen, frozen.freeze())
    }

    func testFreezingDeletedObject() {
        let projection = simpleProjection()
        let object = projection.realm!.objects(SimpleObject.self).first!
        try! projection.realm!.write({
            projection.realm!.delete(object)
        })
        assertThrows(projection.freeze(), "Object has been deleted or invalidated.")
    }
    
    func testFreezeFromWrongThread() {
        let projection = simpleProjection()
        dispatchSyncNewThread {
            self.assertThrows(projection.freeze(), "Realm accessed from incorrect thread")
        }
    }

    func testAccessFrozenObjectFromDifferentThread() {
        let projection = simpleProjection()
        let frozen = projection.freeze()
        dispatchSyncNewThread {
            XCTAssertEqual(frozen.int, 0)
        }
    }

    func testMutateFrozenObject() {
        let projection = simpleProjection()
        var frozen = projection.freeze()
        let realm = frozen.realm!
        assertThrows(try! realm.write { }, "Can't perform transactions on a frozen Realm")
        assertThrows(frozen.int = 1)
    }

    func testObserveFrozenObject() {
        let frozen = simpleProjection().freeze()
        assertThrows(frozen.observe({ _ in }), "Frozen Realms do not change and do not have change notifications.")
    }

    func testFrozenObjectEquality() {
        let projectionA = simpleProjection()
        let frozenA1 = projectionA.freeze()
        let frozenA2 = projectionA.freeze()
        XCTAssertEqual(frozenA1, frozenA2)
        let projectionB = simpleProjection()
        let frozenB = projectionB.freeze()
        XCTAssertNotEqual(frozenA1, frozenB)
    }

    func testFreezeInsideWriteTransaction() {
        let realm = realmWithTestPath()
        var object: SimpleObject!
        var projection: SimpleProjection!
        try! realm.write {
            object = realm.create(SimpleObject.self)
            projection = SimpleProjection(object)
            self.assertThrows(projection.freeze(), "Cannot freeze an object in the same write transaction as it was created in.")
        }
        try! realm.write {
            object.int = 2
            // Frozen objects have the value of the object at the start of the transaction
            XCTAssertEqual(projection.freeze().int, 0)
        }
    }

    func testThaw() {
        let frozen = simpleProjection().freeze()
        XCTAssertTrue(frozen.isFrozen)
        var live = frozen.thaw()!
        XCTAssertFalse(live.isFrozen)
        try! live.realm!.write {
            live.int = 2
        }
        XCTAssertNotEqual(live.int, frozen.int)
    }

    func testThawDeleted() {
        let projection = simpleProjection()
        let frozen = projection.freeze()
        let realm = realmWithTestPath()
        
        XCTAssertTrue(frozen.isFrozen)
        try! realm.write {
            realm.deleteAll()
        }
        let thawed = frozen.thaw()
        XCTAssertNil(thawed, "Thaw should return nil when object was deleted")
    }

    func testThawPreviousVersion() {
        var projection = simpleProjection()
        let frozen = projection.freeze()

        XCTAssertTrue(frozen.isFrozen)
        XCTAssertEqual(projection.int, frozen.int)
        try! projection.realm!.write {
            projection.int = 1
        }
        XCTAssertNotEqual(projection.int, frozen.int, "Frozen object shouldn't mutate")

        let thawed = frozen.thaw()!
        XCTAssertFalse(thawed.isFrozen)
        XCTAssertEqual(thawed.int, projection.int, "Thawed object should reflect transactions since the original reference was frozen.")
    }

    func testThawUpdatedOnDifferentThread() {
        let realm = realmWithTestPath()
        let tsr = ThreadSafeReference(to: projection)
        var frozen: SimpleProjection!
        
        dispatchSyncNewThread {
            var resolvedProjection: SimpleProjection = realm.resolve(tsr)!
            try! realm.write {
                resolvedProjection.int = 1
            }
            frozen = resolvedProjection.freeze()
        }

        let thawed = frozen.thaw()!
        XCTAssertEqual(thawed.int, 0, "Thaw shouldn't reflect background transactions until main thread realm is refreshed")
        realm.refresh()
        XCTAssertEqual(thawed.int, 1)
    }

    func testThawCreatedOnDifferentThread() {
        let realm = realmWithTestPath()
        try! realm.write {
            realm.deleteAll()
        }
        var frozen: SimpleProjection!
        dispatchSyncNewThread {
            let projection = self.simpleProjection()
            frozen = projection.freeze()
        }
        XCTAssertNil(frozen.thaw())
        XCTAssertEqual(realm.objects(SimpleProjection.self).count, 0)
        realm.refresh()
        XCTAssertEqual(realm.objects(SimpleProjection.self).count, 1)
    }
}