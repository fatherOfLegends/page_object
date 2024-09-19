import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// This class exists so page objects can seamlessly be passed to widget testing
/// APIs as Finders. This helps to remove code noise from tests. See the tests
/// in this package for an example.
class PageObject implements Finder {
  /// Creates a [PageObject] for this [Finder]
  PageObject(this._finder);
  final Finder _finder;

  @override
  FinderResult<Element> evaluate() => _finder.evaluate();

  @override
  Iterable<Element> get allCandidates => _finder.allCandidates;

  @override
  String describeMatch(Plurality plurality) => _finder.describeMatch(plurality);

  @override
  Iterable<Element> findInCandidates(Iterable<Element> candidates) =>
      _finder.findInCandidates(candidates);

  @override
  // ignore: deprecated_member_use
  String get description => _finder.description;

  @override
  Iterable<Element> apply(Iterable<Element> candidates) =>
      // ignore: deprecated_member_use
      _finder.apply(candidates);

  @override
  Finder at(int index) => _finder.at(index);

  @override
  Finder get first => _finder.first;

  @override
  FinderResult<Element> get found => _finder.found;

  @override
  bool get hasFound => _finder.hasFound;

  @override
  Finder hitTestable({Alignment at = Alignment.center}) =>
      _finder.hitTestable(at: at);

  @override
  Finder get last => _finder.last;

  @override
  // ignore: deprecated_member_use
  bool precache() => _finder.precache();

  @override
  void reset() => _finder.reset();

  @override
  void runCached(VoidCallback run) => _finder.runCached(run);

  @override
  bool get skipOffstage => _finder.skipOffstage;

  @override
  bool tryEvaluate() => _finder.tryEvaluate();

  @override
  String toString({bool describeSelf = false}) =>
      _finder.toString(describeSelf: describeSelf);
}
