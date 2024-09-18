import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:page_object_fol_edition/page_object.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('PageObject should delegate calls to internal finder.', () {
    final testElement = TestElement();
    final testFinder = TestFinder(testElement);
    final pageObject = PageObject(testFinder);
    expect(pageObject.evaluate(), hasLength(1));
    expect(pageObject.evaluate().first, equals(testElement));
    expect(pageObject.allCandidates, hasLength(1));
    expect(pageObject.allCandidates.first, equals(testElement));
    expect(pageObject.describeMatch(Plurality.one),
        equals('widget with This is a test finder.'));
    expect(pageObject.findInCandidates([]), hasLength(1));
    expect(pageObject.findInCandidates([]).first, equals(testElement));
    expect(pageObject.description, equals('This is a test finder.'));
    expect(pageObject.apply([]), hasLength(1));
    expect(pageObject.apply([]).first, equals(testElement));
    expect(pageObject.at(0), equals(testFinder));
    expect(pageObject.first, equals(testFinder));
    expect(pageObject.found,
        equals(FinderResult((_) => 'Test Element', [testElement])));
    expect(pageObject.hasFound, isTrue);
    expect(pageObject.hitTestable(), equals(testFinder));
    expect(pageObject.last, equals(testFinder));
    expect(pageObject.precache(), isTrue);
    expect(pageObject.skipOffstage, isTrue);
    expect(pageObject.tryEvaluate(), isTrue);
    expect(pageObject.toString(), 'This is a test finder.');
    pageObject.runCached(() {});
    pageObject.reset();
    expect(testFinder.runCachedCalls, hasLength(1));
    expect(testFinder.resetCalls, equals(1));
  });
}

class TestFinder extends Finder {
  TestFinder(this.testElement);

  final Element testElement;
  List<VoidCallback> runCachedCalls = [];
  int resetCalls = 0;
  @override
  Iterable<Element> apply(Iterable<Element> candidates) => [testElement];

  @override
  Iterable<Element> get allCandidates => [testElement];

  @override
  String get description => 'This is a test finder.';

  @override
  FinderResult<Element> evaluate() =>
      FinderResult((_) => 'Test Element', [testElement]);

  @override
  bool precache() => true;

  @override
  void runCached(VoidCallback run) {
    runCachedCalls.add(run);
  }

  @override
  void reset() {
    resetCalls++;
  }

  @override
  FinderResult<Element> get found =>
      FinderResult((_) => 'Test Element', [testElement]);

  @override
  Finder at(int index) => this;

  @override
  Finder get first => this;

  @override
  Finder get last => this;

  @override
  bool get hasFound => true;

  @override
  Finder hitTestable({Alignment at = Alignment.center}) => this;

  @override
  String toString({bool describeSelf = false}) => 'This is a test finder.';
}

class TestElement extends Element {
  TestElement() : super(const SizedBox.shrink());

  @override
  bool get debugDoingBuild => true;

  @override
  void performRebuild() {
    super.performRebuild();
  }
}
