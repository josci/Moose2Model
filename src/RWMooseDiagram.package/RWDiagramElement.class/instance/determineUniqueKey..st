accessing
determineUniqueKey: aFamixElement
	| classScopeString key |
	(aFamixElement class asString = self aFAMIXPackage or: [ aFamixElement class asString = self aFAMIXClass ])
		ifTrue: [ key := aFamixElement class asString , '>' , aFamixElement name asString ]
		ifFalse: [ (aFamixElement class asString = self aFAMIXMethod or: [ aFamixElement class asString = self aFAMIXAttribute ])
				ifTrue: [ aFamixElement hasClassScope
						ifTrue: [ classScopeString := 'cl' ]
						ifFalse: [ classScopeString := 'in' ].
					key := aFamixElement class asString , '>' , aFamixElement parentType name asString , '>' , aFamixElement name asString , '>' , classScopeString ]
				ifFalse: [ key := famixElement mooseID ] ].
	^ key